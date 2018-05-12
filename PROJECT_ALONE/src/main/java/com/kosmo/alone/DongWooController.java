package com.kosmo.alone;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kosmo.alone.vo.HotReviewsVO;
import com.kosmo.alone.vo.HotspotsVO;
import com.kosmo.alone.vo.MonstersVO;

@Controller
public class DongWooController {
	
	@Autowired
	DongWooService dwService;
	
	//리스트 페이지
	@RequestMapping(value = "/hot_spot_list.do", method = RequestMethod.GET)
	public ModelAndView hotSpotList2(HttpServletRequest request, HttpSession session,									
			 @ModelAttribute(value = "hotspotsVO") HotspotsVO hotspotsVO, BindingResult result) {
		
		//세션 하드 코딩. 나중에 지우고 getAttribute 만 살려놓기
		
		int monPk = (Integer)session.getAttribute("monPk");
		hotspotsVO.setMonPk(monPk);
		
		
		if(hotspotsVO.getHotCity()==null || hotspotsVO.getHotCity().equals("") )
			hotspotsVO.setHotCity("서울");//도시 디폴트값
		
//		session.setAttribute("LVL_SESS_CITY", hotspotsVO.getHotCity());버튼식 카테고리에 사용. 지금은 x
		
	
		//paing util
		int currentPage = 1;
		if(request.getParameter("currentPage") != null) 
			currentPage = Integer.parseInt(request.getParameter("currentPage"));		
		hotspotsVO.setCurrentPage(currentPage);
				
		
		ModelAndView mav = new ModelAndView();		
		mav.addAllObjects(dwService.svcHotSpotList(hotspotsVO));
		mav.setViewName("alone/information/alone_hotspots_list");
		
		return mav;
	}
	
	//디테일 페이지
	@RequestMapping(value = "/hot_spot_detail.do")
	public ModelAndView hotSpotDetail(HttpServletRequest request, HttpSession session,
			 @ModelAttribute(value = "hotspotsVO") HotspotsVO hotspotsVO,
			 @ModelAttribute(value = "LVL_MY_REV") HotReviewsVO hotRevVO ){
		ModelAndView mav = new ModelAndView();
		int monPk = (Integer)session.getAttribute("monPk");		
		//몬피케이 하드코딩 테스트 종료 후 삭제 
		 monPk = 1;
		
		hotspotsVO.setMonPk(monPk);
		
		mav.addAllObjects(dwService.svcHotSpotDetail(hotspotsVO));
		mav.addObject("LVL_MY_REV", hotRevVO);//지금 사용 x
		mav.setViewName("alone/information/alone_hotspots_detail");
		return mav;
	}
		
	
		//핫스팟 스크랩 페이지에서 스크랩 삭제
		@RequestMapping(value = "/hotspots_scrap_page_delete.do",  method = RequestMethod.GET)
		public String hotSpotScrapPageDelete(HttpServletRequest request, HttpSession session,
											@RequestParam(value = "hotPk")int hotPk,
											@RequestParam(value = "monPk")int monPk){
				int tempMon = (Integer)session.getAttribute("monPk");
				if(monPk == tempMon){
					HotspotsVO vo = new HotspotsVO();
					vo.setMonPk(monPk);			
					vo.setHotPk(hotPk);		
					
					dwService.svcDeleteScrap(vo);
				}
				return "redirect:/hot_spot_scrap_page.do";
			}
	

	
	
	//ajax리스트 페이지와 디테일 페이지에서 관광지 스크랩 하기. 
	@RequestMapping(value="/ajax_scrap_insert.do", method = RequestMethod.GET)
	@ResponseBody
	public void scrapInsert(HotspotsVO vo, HttpSession session){
		int monPk = (Integer)session.getAttribute("monPk");
		if (monPk != 0){
			if(monPk == vo.getMonPk() )
				dwService.svcInsertScrap(vo);
		}
	}
	//ajax리스트 페이지와 디테일 페이지에서 관광지 스크랩 삭제.
	@RequestMapping(value="/ajax_scrap_delete.do", method = RequestMethod.GET)
	@ResponseBody
	public void scrapDelete(HotspotsVO vo, HttpSession session){
		int monPk = (Integer)session.getAttribute("monPk");
		if (monPk != 0){
			if(monPk == vo.getMonPk() )
				dwService.svcDeleteScrap(vo);
		}
	}
	
	//디테일에서 리뷰 삭제하기
	@RequestMapping(value="/rev_delete.do", method = RequestMethod.GET)
	public String replyDelete(HotReviewsVO vo, HttpSession session){
		int monPk = (Integer)session.getAttribute("monPk");
		if (vo.getMonPk() == monPk){
			int res = dwService.svcRevDelete(vo);
			return "redirect:/hot_spot_detail.do?hotPk="+vo.getHotPk();
		}else
			return "redirect:/hot_spot_detail.do?hotPk="+vo.getHotPk();		
	}
	

	//ajax 디테일 페이지 리뷰 작성. 
	@RequestMapping(value="/ajax_rev_insert.do", method = RequestMethod.POST)
	@ResponseBody
	public HotReviewsVO replyInsert(HotReviewsVO vo, HttpSession session){
		int monPk = (Integer)session.getAttribute("monPk");
		vo.setMonPk(monPk);
//		vo.setMonPk(1);//로그인세션
		
		HotReviewsVO revvo = new HotReviewsVO();
		
		revvo = dwService.svcRevInsert(vo);
		return revvo;
	}

	
	//내가 스크랩 한 페이지 목록. 명소
	@RequestMapping(value = "/hot_spot_scrap_page.do", method = RequestMethod.GET)
	public ModelAndView spotScrapPage(HttpServletRequest request, HttpSession session) {
		int monPk = (Integer)session.getAttribute("monPk");
		MonstersVO vo  = new MonstersVO();
		vo.setMonPk(monPk);
	
		ModelAndView mav = new ModelAndView();			
		mav.addAllObjects(dwService.svcSpotScrapList(vo));
		mav.setViewName("alone/information/alone_hotspots_scrap");
		
		return mav;
	}
	
}
