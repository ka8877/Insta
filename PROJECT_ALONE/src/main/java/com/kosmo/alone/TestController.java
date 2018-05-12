package com.kosmo.alone;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.google.api.plus.Person;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kosmo.alone.vo.CurrentLocVO;
import com.kosmo.alone.vo.DestinationVO;
import com.kosmo.alone.vo.EventVO;
import com.kosmo.alone.vo.MonstersVO;
import com.kosmo.alone.vo.infoVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class TestController {

	@Autowired
	private MinSangService minSangService;
	
	@RequestMapping(value = "/aloneLogin", method = RequestMethod.GET)
	public ModelAndView aloneLogin(ModelAndView mav) {
		mav.setViewName("alone/login/login");
		return mav;
	}
	
	@RequestMapping(value = "/oauthCode", method = RequestMethod.GET)
	public String oauthCode() {
		
		String url = minSangService.oauthCode();

		return "redirect:"+url;
	}
	
	@RequestMapping(value = "/getOauthCode", method = RequestMethod.GET)
	public String getOauthCode(@RequestParam String code, ModelAndView mav, HttpServletRequest request) {
		
		infoVO ivo = minSangService.getToken(code);
		Person person = minSangService.getGoogleProfile(ivo);
		MonstersVO mvo = null;
		
		if (ivo.getRefreshToken() != null) {			//refreshToken이 있으면 google에 가서 정보 가져오기
			
			mvo = minSangService.personToMvo(person, ivo.getRefreshToken());
			int result = minSangService.monInsert(mvo);
			
			if(result == 1){
				mvo = minSangService.monLogin(mvo.getMonEmail(), mvo.getMonId());
				request.getSession().setAttribute("monPk", mvo.getMonPk());
				request.getSession().setAttribute("monToken", mvo.getMonToken());
				request.getSession().setAttribute("monName", mvo.getMonName());
				request.getSession().setAttribute("monProfile", mvo.getMonProfile());
				request.getSession().setAttribute("monLoveball", mvo.getMonLoveball());
				
			} else {
				System.out.println("회원가입에 오류가 있습니다");
				return "redirect:/aloneLogin.do";
			}
			
		} else {										//refreshToken이 없으면 우리 db에서가서 정보 가져오기
			mvo = minSangService.monLogin(person.getAccountEmail(), person.getId());
			
			if(mvo.getMonActivate() == 1){
				request.getSession().setAttribute("monPk", mvo.getMonPk());
				request.getSession().setAttribute("monToken", mvo.getMonToken());
				request.getSession().setAttribute("monName", mvo.getMonName());
				request.getSession().setAttribute("monProfile", mvo.getMonProfile());
				request.getSession().setAttribute("monLoveball", mvo.getMonLoveball());
			} else if(mvo.getMonActivate() == 0){
				System.out.println("계정을 비활성화 하셨습니다");
				request.getSession().setAttribute("disabled", 1);
				return "redirect:/aloneLogin.do";
			}
		}
		return "redirect:/desList.do";
	}
	
	@RequestMapping(value = "/disabled", method = RequestMethod.GET)
	public String disabled(HttpServletRequest request) {
		int monPk = (Integer)request.getSession().getAttribute("monPk");
		String refreshToken = (String)request.getSession().getAttribute("monToken");
		String accessToken = minSangService.getRefresh(refreshToken);
		if(accessToken != null){
			int result = minSangService.disabled(monPk);
			
			if(result == 1){
				return "redirect:/aloneLogin.do";
			} else {
//				이전 페이지 이동
				return request.getHeader("referer");
			}
			
		} else {
			System.out.println("accessToken이 왜 null일까");
			return "redirect:/aloneLogin.do";
		}
	}
	
	@RequestMapping(value = "/desList", method = RequestMethod.GET)
	public ModelAndView desList(ModelAndView mav, HttpServletRequest request) {
		
		int monPk = (Integer)request.getSession().getAttribute("monPk");
		String refreshToken = (String)request.getSession().getAttribute("monToken");
		String accessToken = minSangService.getRefresh(refreshToken);
		
		if(accessToken != null){
			ArrayList<DestinationVO> desList = minSangService.desList(monPk);
			
			for(DestinationVO dvo : desList){
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
				System.out.println(dvo.getDesDateIn());
				try {
					dvo.setDesDateIn(format.format(dateFormat.parse(dvo.getDesDateIn())));
					dvo.setDesDateOut(format.format(dateFormat.parse(dvo.getDesDateOut())));
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			mav.addObject("desList", desList);
			mav.setViewName("alone/login/login-des");
		}
		
		return mav;
	}
	
	@RequestMapping(value = "/desInsert", method = RequestMethod.POST)
	public ModelAndView desInsert(
			DestinationVO dvo, 
			@RequestParam String start,
			@RequestParam String end,
			ModelAndView mav, 
			HttpServletRequest request) {
		
		int monPk = (Integer)request.getSession().getAttribute("monPk");
		String refreshToken = (String)request.getSession().getAttribute("monToken");
		String accessToken = minSangService.getRefresh(refreshToken);
		System.out.println(dvo.getDesName());
		System.out.println(start);
		System.out.println(end);
		
		dvo.setMonPk(monPk);
		dvo.setDesDateIn(start);
		dvo.setDesDateOut(end);
		
		//구글에 가서 등록하고 해당 아이디 받아서 dvo에 setting
		dvo.setDesId(minSangService.insertGoogleCal(accessToken, dvo.getDesName()));
		
		int result = minSangService.desInsert(dvo);
		
		if(result==1){
			int desPk = minSangService.desNewPk(monPk);
			request.getSession().setAttribute("desPk", desPk);
			mav.setViewName("alone/index");
		} else {
			mav.setViewName("alone/login/login-des");
		}
		return mav;
	}
	
	@RequestMapping(value = "/eventList", method = RequestMethod.GET)
	public ModelAndView eventList(ModelAndView mav, HttpServletRequest request) {
		
		int desPk = (Integer)request.getSession().getAttribute("desPk");
		String refreshToken = (String)request.getSession().getAttribute("monToken");
		String accessToken = minSangService.getRefresh(refreshToken);
		
		String desId = minSangService.desDtail(desPk);
//		String desId = "4tq6m9bdopm2gh9q7urp33k9d4@group.calendar.google.com";
		ArrayList<EventVO> arrEvn = minSangService.listGoogleEvt(accessToken, desId);
		
		mav.addObject("list", arrEvn);
		mav.setViewName("alone/calendar/alone_calendar");
		return mav;
	}
	
	@RequestMapping(value = "/eventGet", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> eventGet(@RequestBody EventVO evo, ModelAndView mav, HttpServletRequest request) {
		
		
		int desPk = (Integer)request.getSession().getAttribute("desPk");
		String refreshToken = (String)request.getSession().getAttribute("monToken");
		String accessToken = minSangService.getRefresh(refreshToken);
		
		String desId = minSangService.desDtail(desPk);
//		String desId = "4tq6m9bdopm2gh9q7urp33k9d4@group.calendar.google.com";
		Map<String, String> result = minSangService.getGoogleEvt(accessToken, desId, evo);
		
		return result;
	}
	
	@RequestMapping(value = "/eventInsert", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> eventInsert(@RequestBody EventVO evo, HttpServletRequest request) {
		System.out.println("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
		//System.out.println(evo.getSummary());
		System.out.println(evo.getStartDate());
		System.out.println(evo.getEndDate());
		
//		String result = "ggggg";
		
		int desPk = (Integer)request.getSession().getAttribute("desPk");
		String desId = minSangService.desDtail(desPk);
		
		String refreshToken = (String)request.getSession().getAttribute("monToken");
		String accessToken = minSangService.getRefresh(refreshToken);
		
		Map<String, String> result = minSangService.insertGoogleEvt(accessToken, desId, evo);
		return result;
	}
	
	@RequestMapping(value = "/eventUpdate", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> eventUpdate(@RequestBody EventVO evo, HttpServletRequest request) {
//		
		System.out.println("++++++++++++++++++++++"+evo.getSummary());
		
		int desPk = (Integer)request.getSession().getAttribute("desPk");
		String desId = minSangService.desDtail(desPk);
		
		String refreshToken = (String)request.getSession().getAttribute("monToken");
		String accessToken = minSangService.getRefresh(refreshToken);
		
		Map<String, String> result = minSangService.updateGoogleEvt(accessToken, desId, evo);
//		Map<String, String> result = new HashMap<String, String>();
//		
//		result.put("summary", "summary가랏");
//		result.put("description", "description가랏");
//		result.put("htmlLink", "htmlLink가랏");
		return result;
	}
	
	@RequestMapping(value = "/eventQuickAdd", method = RequestMethod.POST)
	public String eventQuickAdd(EventVO evo, ModelAndView mav, HttpServletRequest request) {
		
		int desPk = (Integer)request.getSession().getAttribute("desPk");
		String desId = minSangService.desDtail(desPk);
		
		String refreshToken = (String)request.getSession().getAttribute("monToken");
		String accessToken = minSangService.getRefresh(refreshToken);
		
		String result = minSangService.quickGoogleEvt(accessToken, desId, evo);
		
		return result;
	}
	
	@RequestMapping(value = "/eventDelete.do", method = RequestMethod.POST)
	@ResponseBody
	public String eventDelete(@RequestBody EventVO evo, HttpServletRequest request) {
		
		System.out.println("삭제 안되지?");
		System.out.println(evo.getEvtId());
		
		int desPk = (Integer)request.getSession().getAttribute("desPk");
		String desId = minSangService.desDtail(desPk);
		
		String refreshToken = (String)request.getSession().getAttribute("monToken");
		String accessToken = minSangService.getRefresh(refreshToken);
		
		int response = minSangService.deleteGoogleEvt(accessToken, desId, evo.getEvtId());
		
		String result = null;
		if(response == 1){
			result = "Delete Success";
		} else {
			result = "Delete Fuck";
		}
		return result;
	}
	
	@RequestMapping(value="/currentLoc.do")
	@ResponseBody
	public int insertCurrentLocation(@RequestBody CurrentLocVO cvo){
		System.out.println("[LOG: currentLoc.do의  insertCurrentLocation 실행]");
		cvo.setCurLat(Double.parseDouble(cvo.getLatitude()));
		cvo.setCurLng(Double.parseDouble(cvo.getLongitude()));
		return minSangService.svcInsertCurrent(cvo);
	}
	
	@RequestMapping(value = "/indexPage", method = RequestMethod.POST)
	public ModelAndView indexPage(@RequestParam int desPk, ModelAndView mav, HttpServletRequest request) {
		request.getSession().setAttribute("desPk", desPk);
		mav.setViewName("alone/index");
		return mav;
	}
	
	@RequestMapping(value = "/home.do")
	public ModelAndView indexPage(ModelAndView mav, HttpServletRequest request) {
		mav.setViewName("alone/index");
		return mav;
	}
    		
	
	
}
