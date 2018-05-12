package com.kosmo.alone;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kosmo.alone.vo.HotRoutesVO;
import com.kosmo.alone.vo.HotspotsVO;
import com.kosmo.alone.vo.RoutesVO;
import com.kosmo.alone.vo.RoutesViewVO;

@Controller
public class DeHeeController {

	@Autowired
	private DeHeeService impl;

	@RequestMapping(value = "/make_route.do")
	public ModelAndView mapList() {
		ModelAndView mav = new ModelAndView();
		ArrayList<HotspotsVO> list = impl.hotList();
		
		mav.addObject("list", list);
		mav.setViewName("alone/recommendation/alone_newSchedule");
		return mav;
	}

	@RequestMapping(value = "/recommend.do")
	public ModelAndView recommend() {
		ModelAndView mav = new ModelAndView();
		ArrayList<RoutesVO> list = impl.routeList();
		
		mav.addObject("list", list);
		mav.setViewName("alone/recommendation/alone_recommend");
		return mav;
	}

	@RequestMapping(value = "/rec_detail.do", method = RequestMethod.GET)
	public ModelAndView boardDetail(HttpServletRequest request){
		int rouPk = Integer.parseInt(request.getParameter("rouPk"));
		ArrayList<RoutesViewVO> list = impl.routeViewList(rouPk);
		impl.routeReviewUpdate(rouPk);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("alone/recommendation/alone_recommend_detail");
		mav.addObject("list", list);

		return mav;
	}

	@RequestMapping(value = "/route_detail_input.do", method = RequestMethod.GET)
	public ModelAndView routeDetailInput(HttpServletRequest request) {
		String rouPk = request.getParameter("rouPk");
		RoutesVO vo = impl.getRoute(Integer.parseInt(rouPk));
		ModelAndView mav = new ModelAndView();
		ArrayList<HotspotsVO> list = impl.hotList();
		
		mav.addObject("vo", vo);
		mav.addObject("list", list);
		mav.setViewName("alone/recommendation/alone_route_detail_input");
		return mav;
	}

	@RequestMapping(value = "/route_detail_insert.do")
	public void routeDetailInsert(HttpServletResponse response, HttpServletRequest request, HotRoutesVO vo) throws IOException {
		impl.hotRouteInsert(vo);
		response.sendRedirect("/route_input.do");
	}

	@RequestMapping(value = "/route_input.do")
	public ModelAndView routeInput() {
		ModelAndView mav = new ModelAndView();
		ArrayList<RoutesVO> list = impl.noRouteList();
		ArrayList<RoutesVO> list2 = impl.routeList();
		
		mav.addObject("list", list);
		mav.addObject("list2", list2);
		mav.setViewName("alone/recommendation/alone_route_input");
		return mav;
	}

	@RequestMapping(value = "/spot_input.do")
	public ModelAndView spotInput() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("alone/recommendation/alone_spot_input");
		return mav;
	}

	@RequestMapping(value = "/spot_insert.do")
	public void spotInsert(HttpServletResponse response, HotspotsVO vo) throws IOException{
		impl.spotInsert(vo);
		response.sendRedirect("/spot_input.do");
	}

	@RequestMapping(value = "/contract.do")
	public ModelAndView contract() {
		ModelAndView mav = new ModelAndView();		
		mav.setViewName("alone/information/alone_contract");
		return mav;
	}

	@RequestMapping(value = "/route_insert.do")
	public void routeInsert(HttpServletResponse response, RoutesVO vo) throws IOException{
		impl.routeInsert(vo);
		response.sendRedirect("/route_input.do");
	}

	@RequestMapping(value = "/route_delete.do", method = RequestMethod.POST)
	public void replyDelete(HttpServletResponse response, RoutesVO vo) throws IOException{
		impl.routeDelete(vo);
		response.sendRedirect("/route_input.do");
	}
	
	public void routeSend(HttpSession session) throws IOException{
		int monPk=(Integer)session.getAttribute("monPk");
	}
	

}
