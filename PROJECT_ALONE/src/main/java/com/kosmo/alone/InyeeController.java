package com.kosmo.alone;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kosmo.alone.vo.CurrentLocVO;
import com.kosmo.alone.vo.LikesVO;
import com.kosmo.alone.vo.MessagesVO;
import com.kosmo.alone.vo.MonstersVO;
import com.kosmo.alone.vo.ProductsVO;
import com.kosmo.common.common.KakaoPay;
import com.kosmo.common.common.OpenVO;

@Controller
@RequestMapping(value="/community")
public class InyeeController {
	@Autowired
	private InYeeService inyeeService;
	
	@Autowired
	private KangService kangService;
	
	@RequestMapping(value="/main.do")
	public ModelAndView currentUsersList(HttpServletRequest request){
		//request가 구버전 session은 spring이 제어 가능하므로 HttpSession 바로 받아도 컨트롤 가능
		
		HttpSession session = request.getSession();
		int monPk = Integer.parseInt(session.getAttribute("monPk").toString());
		MonstersVO vo = kangService.svcSelectMember(monPk);session.setAttribute("monLoveball", vo.getMonLoveball());
		System.out.println("[LOG: /main.do의 currentUsersList 출력]");
		Map<String,Object> map = inyeeService.svcCurrentUsersList(monPk, request);
		ModelAndView mav = new ModelAndView();
		mav.addObject("mvo", map.get("mvo"));
		mav.addObject("curUserList", map.get("curUserList"));
		mav.addObject("msgList", map.get("msgList"));
		mav.addObject("html", map.get("html"));
		mav.setViewName("alone/community/alone_like_main");
		
		return mav;
	}
	
	@RequestMapping(value="/search.do")
	public ModelAndView sameDestination(String name, String start, String end, HttpServletRequest request){
		System.out.println("[LOG: /search.do의 sameDestination 출력]");
		System.out.println("from jsp" + name + " / " + start + " / " + end);
		Map<String, Object> map = inyeeService.svcSameDestination(name, start, end, request);
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("mvo", map.get("mvo"));
		mav.addObject("curUserList", map.get("sameDestination"));
		mav.addObject("msgList", map.get("msgList"));
		mav.addObject("html", map.get("html"));
		mav.addObject("start", start);
		mav.addObject("end",end);
		mav.setViewName("alone/community/alone_like_main");

		return mav;
	}
	
	
	@RequestMapping(value="/countLoveball.do")
	@ResponseBody
	public int countLoveball(@RequestBody LikesVO lvo) {
		System.out.println("[LOG: /countLoveball.do의 countLoveball 실행]");
		return inyeeService.svcCountLoveball(lvo);
	}
	
	@RequestMapping(value="/productList.do")
	@ResponseBody
	public ArrayList<ProductsVO> productList(){
		System.out.println("[LOG: /productList.do의 productList 실행]");
		return inyeeService.svcProductList();
	}
	
	@RequestMapping(value="approval.do")
	public String kakaoSuccess(HttpSession session){
		System.out.println("[LOG: approval.do의  kakaoSuccess실행]");
		int monPk = Integer.parseInt(session.getAttribute("monPk").toString());
		int proPk = Integer.parseInt(session.getAttribute("proPk").toString());
		int cnt = Integer.parseInt(session.getAttribute("proCnt").toString());
		System.out.println(" 세션:" + monPk + " / " + proPk + " / " + cnt);
		inyeeService.svcInsertPayments(monPk, proPk, cnt);
		session.removeAttribute("proCnt");
		session.removeAttribute("proPk");
		return "redirect: /community/main.do";
	}
	
	@RequestMapping(value="/kakaoPay.do")
	@ResponseBody
	public String kakaoPay(@RequestBody OpenVO ovo, HttpSession session){
		System.out.println("[LOG: /kakaoPay.do의 kakaoPay 실행]");
		ProductsVO pvo = inyeeService.svcKakaoPay(ovo);
		System.out.println("가격"+pvo.getProPrice());
		int cnt = pvo.getProPrice()/100;
//		HttpSession session = request.getSession();
		session.setAttribute("proCnt", cnt);
		session.setAttribute("proPk", pvo.getProPk());
		
		inyeeService.svcChangeCharged(Integer.parseInt(session.getAttribute("monPk").toString()));
		HashMap<String, Object> prm = new HashMap<String, Object>();
		HashMap<String, Object> resMap = new HashMap<String, Object>();
		Date date = new Date();
		date.toString();
				
				prm.put("cid","TC0ONETIME");
				prm.put("partner_order_id", date.toString());
				prm.put("partner_user_id","COMEALONE");
				prm.put("item_name",pvo.getProDetail());
				prm.put("quantity",pvo.getProPrice());
				prm.put("total_amount",pvo.getProPrice());
				prm.put("tax_free_amount",pvo.getProPrice());
				prm.put("vat_amount",0);
				prm.put("approval_url","http://localhost/community/approval.do");
				System.out.println(prm.get("approval_url"));
				prm.put("cancel_url","http://localhost/community/main.do");
				prm.put("fail_url","http://localhost/community/main.do");

				ovo.setUrl("https://kapi.kakao.com/v1/payment/ready");
				ovo.setRequestMethod("POST");
				ovo.setHost("https://kapi.kakao.com");
				ovo.setAuth("Bearer {"+ovo.getAccess_token()+"}");
				ovo.setMap(prm);
				
				KakaoPay kp = new KakaoPay();
				resMap = kp.openAPI(ovo);
				System.out.println(resMap.get("code") + "----" + resMap.get("message"));

				
				
			
				
				return (String) resMap.get("message");
	}
	
	@RequestMapping(value="/addLike.do")
	@ResponseBody
	public Map<String,Object> insertLike(@RequestBody LikesVO lvo){
		System.out.println("[LOG: /addLike.do의  insertLike 실행]");
		return inyeeService.svcInsertLike(lvo);
	}
	
	
	@RequestMapping(value="/removeLike.do")
	@ResponseBody
	public int deleteLike(@RequestBody LikesVO lvo){
		System.out.println("[LOG: /removeLike.do의  deleteLike 실행]");
		return inyeeService.svcDeleteLike(lvo);
	}
	
	@RequestMapping(value="/isMatched.do")
	@ResponseBody
	public int checkLike(@RequestBody LikesVO lvo) {
		System.out.println("[LOG: /isMatched.do의  checkLike 실행]");
		return inyeeService.svcCheckLike(lvo);
	}
	
	@RequestMapping(value="/msgTexts.do")
	@ResponseBody
	public ArrayList<MessagesVO> selectMessages(@RequestBody MessagesVO mvo) {
		System.out.println("[LOG: /msgTexts.do의  selectMsg 실행]");
		return inyeeService.svcSelectMessages(mvo);
	}
	
	@RequestMapping(value="/deleteMsg.do")
	@ResponseBody
	public int deleteMessages(@RequestBody MessagesVO mvo) {
		System.out.println("[LOG: /deleteMsg.do의  deleteMessages 실행]");
		return inyeeService.svcDeleteMsg(mvo);
	}
	
	@RequestMapping(value="/currentLoc.do")
	@ResponseBody
	public int insertCurrentLocation(CurrentLocVO cvo){
		System.out.println("[LOG: currentLoc.do의  insertCurrentLocation 실행]");
		return inyeeService.svcInsertCurrent(cvo);
	}
	
/*	@RequestMapping(value="/addMsg.do")
	@ResponseBody
	public ArrayList<MessagesVO> insertMsg(@RequestBody MessagesVO mvo) {
		System.out.println("[LOG: /addMsg.do의  insertMsg 실행]");
		return inyeeService.svcInsertMsg(mvo);
	}*/
	

}
