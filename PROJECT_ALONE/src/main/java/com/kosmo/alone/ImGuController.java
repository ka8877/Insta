package com.kosmo.alone;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.alone.common.PagingUtil;
import com.kosmo.alone.vo.GalleryVO;
import com.kosmo.alone.vo.LikesVO;
import com.kosmo.alone.vo.MonstersVO;
import com.kosmo.alone.vo.ProductsVO;

@Controller
public class ImGuController {
	
	@Autowired
	private ImGuService impl;
	
	int upload_file_max_size = 100000000;
	String upload_file_dir = "C:\\Users\\dmdel\\Desktop\\myworkspace\\springkang\\PROJECT_ALONE\\src\\main\\webapp\\img\\profile";
	String upload_file_dir2 ="C:\\Users\\dmdel\\Desktop\\myworkspace\\springkang\\PROJECT_ALONE\\src\\main\\webapp\\img\\gallery";
	String upload_file_format = "UTF-8";
	
	
//	@RequestMapping(value = "/test2.do")
//	public String home() {
//		return "alone/scrap/alone_test";
//	}
//	
//	@RequestMapping(value = "/test.do")
//	public ModelAndView home2(HttpServletRequest request) {
//		ModelAndView mav = new ModelAndView();
//		System.out.println("모델앤뷰");
//		System.out.println(request.getHeader("token"));
//		mav.setViewName("alone/information/alone_test");
//		return mav;
//	}
	
	@RequestMapping(value = "/profile.do")
	public ModelAndView monsterDetail(HttpServletRequest request,MonstersVO vo,HttpSession session) {
		
		
		int monPk=(Integer)session.getAttribute("monPk");
		vo.setMonPk(monPk);		
		ModelAndView mav = new ModelAndView();
		MonstersVO detail = impl.svcMonsterDetail(vo);
		MonstersVO pro =impl.svcProfileDetail(vo);
		String test[]=null;
		
		if(detail.getMonBirthday() != null){
			test=detail.getMonBirthday().split("-");
			String year = test[0];String month = test[1];String day = test[2];
			mav.addObject("year", year);
			mav.addObject("month", month);
			mav.addObject("day", day);
		}else{
			String year = " ";String month = " ";String day = " ";
			mav.addObject("year", year);
			mav.addObject("month", month);
			mav.addObject("day", day);
		}
		
		mav.addObject("detail",detail);
		mav.addObject("pro",pro);
		
		mav.setViewName("alone/community/alone_profile");
		return mav;
	}
	@RequestMapping(value = "/gallery.do")
	public ModelAndView galleryList(HttpServletRequest request,GalleryVO vo,MonstersVO vo1,HttpSession session) {
		int monPk=(Integer)session.getAttribute("monPk");
		vo1.setMonPk(monPk);		
		vo.setMonPk(monPk);		

		
		int currentPage = 1;


		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		//BoardDAO impl = new BoardDAO();
		int totalCount = impl.svcGalleryCount(monPk);


		//------------페이징
		PagingUtil pu
		= new PagingUtil("/gallery.do?"
				, currentPage
				, totalCount  //------------
				, 9//선택한 2번 블럭에 나타날 게시물 갯수
				, 5 // 1 2 [다음]
				);
		String  html = pu.getPagingHtml();
		
		vo.setSseq(pu.getStartSeq());
		vo.setEseq(pu.getEndSeq());
		ModelAndView mav = new ModelAndView();
	
		
		ArrayList<GalleryVO> gallery = impl.svcGalleryList(vo);
		MonstersVO detail = impl.svcMonsterDetail(vo1);
		MonstersVO pro =impl.svcProfileDetail(vo1);

		
		mav.addObject("gallery", gallery);	
		mav.addObject("detail",detail);
		mav.addObject("pro",pro);
		mav.addObject("paging", html);
	
		mav.setViewName("alone/community/alone_gallery");
		return mav;
	}
	@RequestMapping(value = "/payment.do")
	public ModelAndView payment(HttpServletRequest request,MonstersVO vo,HttpSession session) {
		int monPk=(Integer)session.getAttribute("monPk");
		vo.setMonPk(monPk);		
		
		int currentPage = 1;


		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}


		
		//BoardDAO impl = new BoardDAO();
		int totalCount = impl.svcPaymentsCount(monPk);


		//------------페이징
		PagingUtil pu
		= new PagingUtil("/payment.do?"
				, currentPage
				, totalCount  //------------
				, 5//선택한 2번 블럭에 나타날 게시물 갯수
				, 5 // 1 2 [다음]
				);
		String  html = pu.getPagingHtml();
		
		vo.setSseq(pu.getStartSeq());
		vo.setEseq(pu.getEndSeq());
		ModelAndView mav = new ModelAndView();
		MonstersVO detail = impl.svcMonsterDetail(vo);
		MonstersVO pro =impl.svcProfileDetail(vo);
		ArrayList<ProductsVO> pay =impl.svcPaymentsList(vo);
		mav.addObject("pay",pay);
		mav.addObject("pro",pro);
		mav.addObject("detail",detail);
		mav.addObject("paging", html);
		mav.setViewName("alone/community/alone_payment");
		return mav;

	}
	@RequestMapping(value = "/payment2.do")
	public ModelAndView payment2(HttpServletRequest request,MonstersVO vo,HttpSession session) {
		int monPk=(Integer)session.getAttribute("monPk");	
		vo.setMonPk(monPk);		
		int currentPage = 1;


		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		//BoardDAO impl = new BoardDAO();
		int totalCount = impl.svcLikesCount(monPk);


		//------------페이징
		PagingUtil pu
		= new PagingUtil("/payment2.do?"
				, currentPage
				, totalCount  //------------
				, 5//선택한 2번 블럭에 나타날 게시물 갯수
				, 5 // 1 2 [다음]
				);
		String  html = pu.getPagingHtml();
		
		vo.setSseq(pu.getStartSeq());
		vo.setEseq(pu.getEndSeq());
		ModelAndView mav = new ModelAndView();
		MonstersVO detail = impl.svcMonsterDetail(vo);
		MonstersVO pro =impl.svcProfileDetail(vo);
		ArrayList<LikesVO> like =impl.svclikeList(vo);
		//ArrayList<MonstersVO> testList = impl.svclikeList(vo);
		//System.out.println(like.get(0).getLikeList().size());
		mav.addObject("like",like);
		mav.addObject("pro",pro);
		mav.addObject("detail",detail);
		mav.addObject("paging", html);
		mav.setViewName("alone/community/alone_payment2");
		return mav;

	}
	@RequestMapping(value = "/activate.do")
	public ModelAndView activate(HttpServletRequest request,MonstersVO vo,HttpSession session) {
		int monPk=(Integer)session.getAttribute("monPk");
		vo.setMonPk(monPk);		
		ModelAndView mav = new ModelAndView();
		MonstersVO detail = impl.svcMonsterDetail(vo);
		MonstersVO pro =impl.svcProfileDetail(vo);
		mav.addObject("pro",pro);
		mav.addObject("detail",detail);
		mav.setViewName("alone/community/alone_activate");
		return mav;
	}
	@RequestMapping(value = "/update.do",method=RequestMethod.POST)
	public String update(HttpServletRequest request,MonstersVO vo,HttpSession session) {
		int monPk=(Integer)session.getAttribute("monPk");
		vo.setMonPk(monPk);	
		
			String year = vo.getMonBirth1();
	        String month = vo.getMonBirth2();
	        String day = vo.getMonBirth3();
	        
	        String Birthday = year+"-"+month+"-"+day;
	        
	        vo.setMonBirthday(Birthday); 
	        
	        
		impl.svcMonstersUpdate(vo);
		return "redirect:profile.do";				
	}
	@RequestMapping(value = "/prodel.do")
	public String prodel(HttpServletRequest request,MonstersVO vo,HttpSession session) {
		int monPk=(Integer)session.getAttribute("monPk");
		vo.setMonPk(monPk);	

		impl.svcProfileDelete(vo);
		return "redirect:profile.do";
				

	}
	@RequestMapping(value = "/prodel2.do")
	public String prodel2(HttpServletRequest request,MonstersVO vo,HttpSession session) {
		int monPk=(Integer)session.getAttribute("monPk");
		vo.setMonPk(monPk);		

		impl.svcProfileDelete(vo);
		return "redirect:gallery.do";
				

	}
	@RequestMapping(value = "/prodel3.do")
	public String prodel3(HttpServletRequest request,MonstersVO vo,HttpSession session) {
		int monPk=(Integer)session.getAttribute("monPk");
		vo.setMonPk(monPk);		

		impl.svcProfileDelete(vo);
		return "redirect:payment.do";
				

	}
	@RequestMapping(value = "/prodel4.do")
	public String prodel4(HttpServletRequest request,MonstersVO vo,HttpSession session) {
		int monPk=(Integer)session.getAttribute("monPk");
		vo.setMonPk(monPk);			

		impl.svcProfileDelete(vo);
		return "redirect:activate.do";
				

	}
	@RequestMapping(value = "/proup.do")
	public String proup(MonstersVO vo,HttpSession session) 
			throws IOException{
		int monPk=(Integer)session.getAttribute("monPk");
		vo.setMonPk(monPk);	
		MultipartFile file = vo.getFile();
		String fullPath = upload_file_dir + "\\" + file.getOriginalFilename();
			File f = new File(fullPath);
			file.transferTo(f);
			vo.setMonProfile(f.getName());

		impl.svcProfileUpdate(vo);
		
		
		return "redirect:profile.do";
		}
	@RequestMapping(value = "/proup2.do")
	public String proup2(MonstersVO vo,HttpSession session) 
			throws IOException{
		int monPk=(Integer)session.getAttribute("monPk");
		vo.setMonPk(monPk);	
		MultipartFile file = vo.getFile();
	
		String fullPath = upload_file_dir + "\\" + file.getOriginalFilename();
			File f = new File(fullPath);
			file.transferTo(f);
			vo.setMonProfile(f.getName());

		impl.svcProfileUpdate(vo);
		
	
		
		return "redirect:gallery.do";
		}
	@RequestMapping(value = "/proup3.do")
	public String proup3(MonstersVO vo,HttpSession session) 
			throws IOException{
		int monPk=(Integer)session.getAttribute("monPk");
		vo.setMonPk(monPk);	
		MultipartFile file = vo.getFile();
		String fullPath = upload_file_dir + "\\" + file.getOriginalFilename();
			File f = new File(fullPath);
			file.transferTo(f);
			vo.setMonProfile(f.getName());

		impl.svcProfileUpdate(vo);
	
		
		return "redirect:payment.do";
		}
	@RequestMapping(value = "/proup4.do")
	public String proup4(MonstersVO vo,HttpSession session) 
			throws IOException{
		int monPk=(Integer)session.getAttribute("monPk");
		vo.setMonPk(monPk);			
 
		MultipartFile file = vo.getFile();
		String fullPath = upload_file_dir + "\\" + file.getOriginalFilename();
			File f = new File(fullPath);
			file.transferTo(f);
			vo.setMonProfile(f.getName());

		impl.svcProfileUpdate(vo);
	
		
		return "redirect:activate.do";
		}
	@RequestMapping(value = "/galup.do")
	public String galup(GalleryVO vo,HttpSession session) 
			throws IOException{
		int monPk=(Integer)session.getAttribute("monPk");
		vo.setMonPk(monPk);	
		MultipartFile file = vo.getFile1();
		String fullPath = upload_file_dir2 + "\\" + file.getOriginalFilename();
			File f = new File(fullPath);
			file.transferTo(f);
			vo.setGalUrl(f.getName());

		impl.svcGalleryInsert(vo);
				
		return "redirect:gallery.do";
		}
	@RequestMapping(value = "/galdel.do")
	public String galdel(GalleryVO vo,HttpSession session) 
			throws IOException{
		int monPk=(Integer)session.getAttribute("monPk");
		vo.setMonPk(monPk);	
		impl.svcGalleryDelete(vo);				
		return "redirect:gallery.do";
		}
	@RequestMapping(value = "/activeup.do")
	public String activeup(HttpServletRequest request,MonstersVO vo,HttpSession session) {
		int monPk=(Integer)session.getAttribute("monPk");
		vo.setMonPk(monPk);	
		impl.svcMonsterDeactivate(vo);
		return "redirect:activate.do";
				

	}
	
}
