package com.kosmo.alone;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alone.common.PagingUtil;
import com.kosmo.alone.vo.BoardScrapVO;
import com.kosmo.alone.vo.BoardsVO;
import com.kosmo.alone.vo.CategoriesVO;
import com.kosmo.alone.vo.MonstersVO;
import com.kosmo.alone.vo.ReplyVO;

@Controller
public class KangController {

	@Autowired
	private KangService impl;
	@Autowired
	private KangService test;


	@RequestMapping(value = "/cateList.do")
	public ModelAndView categoryList(HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView();
//		int monPk = (Integer) session.getAttribute("monPk");
		HashMap<String, Object>map = impl.svcCategoryList();
		mav.addObject("a", map.get("유적지"));
		mav.addObject("b", map.get("종교"));
		mav.addObject("c", map.get("전시"));
		mav.addObject("d", map.get("거리"));
		mav.addObject("e", map.get("공원"));
		mav.addObject("f", map.get("건축물"));
		mav.addObject("g", map.get("교육"));
		mav.addObject("h", map.get("자연"));
		mav.addObject("i", map.get("문화"));
		mav.addObject("j", map.get("테마파크"));
		mav.addObject("k", map.get("스포츠"));
		mav.addObject("l", map.get("기타"));
		
		mav.setViewName("alone/community/alone_category");
		return mav;
	}

	@RequestMapping(value = "/cateBoardsAllList.do")
	public ModelAndView selectCategory(CategoriesVO cateVO, HttpServletRequest request, BoardsVO bVO) {
		ModelAndView mav = new ModelAndView();

		int catePk = cateVO.getCatePk();
		String url = "/cateBoardsAllList.do?catePk=" + catePk + "&?";
		int currentPage = 1;
		int totalCount = impl.svcboardsAllCount(catePk);
		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		PagingUtil util = new PagingUtil(url, currentPage, totalCount, 5, 5);
		bVO.setCatePk(catePk);
		bVO.setSseq(util.getStartSeq());
		bVO.setEseq(util.getEndSeq());
		String html = util.getPagingHtml();
		ArrayList<BoardsVO> tempList = impl.svcCateBoardsAllList(bVO);
		ArrayList<BoardsVO> boardsList2 = impl.svcBrList(tempList);
		mav.setViewName("alone/community/alone_boards");
		if(tempList.size()>0){
			mav.addObject("cateName", tempList.get(0).getCateName());
			mav.addObject("confirm", "day");
			mav.addObject("catePk", tempList.get(0).getCatePk());
			mav.addObject("boardsList", boardsList2);
			mav.addObject("PAGING", html);
			return mav;
		}else{
			mav.addObject("cateName", cateVO.getCateName());
			mav.addObject("confirm", "day");
			mav.addObject("catePk", cateVO.getCatePk());
			mav.addObject("boardsList", boardsList2);
			mav.addObject("PAGING", html);
			
		}
		return mav;
	}
	
	@RequestMapping(value = "/boardsAllscrap.do")
	public ModelAndView boardsAllscrap(CategoriesVO cateVO, HttpServletRequest request, BoardsVO bVO) {
		ModelAndView mav = new ModelAndView();

		int catePk = cateVO.getCatePk();
		String url = "/boardsAllscrap.do?catePk=" + catePk + "&?";
		int currentPage = 1;
		int totalCount = impl.svcboardsAllCount(catePk);
		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		PagingUtil util = new PagingUtil(url, currentPage, totalCount, 5, 5);
		bVO.setCatePk(catePk);
		bVO.setSseq(util.getStartSeq());
		bVO.setEseq(util.getEndSeq());
		String html = util.getPagingHtml();
		ArrayList<BoardsVO> tempList = impl.svcBoardsScntList(bVO);
		ArrayList<BoardsVO> boardsList2 = impl.svcBrList(tempList);
		mav.setViewName("alone/community/alone_boards");
		mav.addObject("cateName", tempList.get(0).getCateName());
		mav.addObject("confirm", "scnt");
		mav.addObject("catePk", tempList.get(0).getCatePk());
		mav.addObject("boardsList", boardsList2);
		mav.addObject("PAGING", html);
		return mav;
	}
	
	@RequestMapping(value = "/boardsAllreply.do")
	public ModelAndView boardsAllreply(CategoriesVO cateVO, HttpServletRequest request, BoardsVO bVO) {
		ModelAndView mav = new ModelAndView();

		int catePk = cateVO.getCatePk();
		String url = "/boardsAllreply.do?catePk=" + catePk + "&?";
		int currentPage = 1;
		int totalCount = impl.svcboardsAllCount(catePk);
		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		PagingUtil util = new PagingUtil(url, currentPage, totalCount, 5, 5);
		bVO.setCatePk(catePk);
		bVO.setSseq(util.getStartSeq());
		bVO.setEseq(util.getEndSeq());
		String html = util.getPagingHtml();
		ArrayList<BoardsVO> tempList = impl.svcBoardsRcntList(bVO);
		ArrayList<BoardsVO> boardsList2 = impl.svcBrList(tempList);
		mav.setViewName("alone/community/alone_boards");
		mav.addObject("cateName", tempList.get(0).getCateName());
		mav.addObject("confirm", "rcnt");
		mav.addObject("catePk", tempList.get(0).getCatePk());
		mav.addObject("boardsList", boardsList2);
		mav.addObject("PAGING", html);
		return mav;
	}

	@RequestMapping(value = "/bestBoardsList.do")
	public ModelAndView bestBoardList(CategoriesVO cateVO, HttpServletRequest request, BoardsVO bVO) {
		ModelAndView mav = new ModelAndView();

		int boaGubun = bVO.getBoaGubun();
		int catePk = cateVO.getCatePk();
		String url = "/bestBoardsList.do?catePk=" + catePk +"&boaGubun="+boaGubun+"&?";
		int currentPage = 1;												
		int totalCount = impl.svcBoardsBestCount(bVO);
		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		PagingUtil util = new PagingUtil(url, currentPage, totalCount, 5, 5);
		bVO.setCatePk(catePk);
		bVO.setSseq(util.getStartSeq());
		bVO.setEseq(util.getEndSeq());
		String html = util.getPagingHtml();
		ArrayList<BoardsVO> tempList = impl.svcCateBoardsBestList(bVO);
		ArrayList<BoardsVO> boardsList2 = impl.svcBrList(tempList);
		if(tempList.size()>0){
			mav.addObject("cateName", tempList.get(0).getCateName());
			mav.addObject("catePk", tempList.get(0).getCatePk());
			mav.addObject("confirm", "day");
			mav.addObject("boaGubun", boaGubun);
			mav.addObject("boardsList", boardsList2);
			mav.addObject("PAGING", html);
			mav.setViewName("alone/community/alone_bestBoards");
			
			return mav;
			
		}else{
			mav.addObject("catePk", cateVO.getCatePk());
			mav.addObject("confirm", "day");
			mav.addObject("boaGubun", boaGubun);
			mav.addObject("boardsList", boardsList2);
			mav.addObject("PAGING", html);
			mav.setViewName("alone/community/alone_bestBoards");
		}
		return mav;
	}
	
	@RequestMapping(value = "/boardsScntBestList.do")
	public ModelAndView boardsScntBestList(CategoriesVO cateVO, HttpServletRequest request, BoardsVO bVO) {
		ModelAndView mav = new ModelAndView();

		int boaGubun = bVO.getBoaGubun();
		int catePk = cateVO.getCatePk();
		String url = "/boardsScntBestList.do?catePk=" + catePk +"&boaGubun="+boaGubun+"&?";
		int currentPage = 1;
		int totalCount = impl.svcBoardsBestCount(bVO);
		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		PagingUtil util = new PagingUtil(url, currentPage, totalCount, 5, 5);
		bVO.setCatePk(catePk);
		bVO.setSseq(util.getStartSeq());
		bVO.setEseq(util.getEndSeq());
		String html = util.getPagingHtml();
		ArrayList<BoardsVO> tempList = impl.svcBoardsScntBestList(bVO);
		ArrayList<BoardsVO> boardsList2 = impl.svcBrList(tempList);
		mav.addObject("cateName", tempList.get(0).getCateName());
		mav.addObject("catePk", tempList.get(0).getCatePk());
		mav.addObject("confirm", "scnt");
		mav.addObject("boaGubun", boaGubun);
		mav.addObject("boardsList", boardsList2);
		mav.addObject("PAGING", html);
		mav.setViewName("alone/community/alone_bestBoards");
			
		return mav;
	}
	
	@RequestMapping(value = "/boardsRcntBestList.do")
	public ModelAndView boardsRcntBestList(CategoriesVO cateVO, HttpServletRequest request, BoardsVO bVO) {
		ModelAndView mav = new ModelAndView();

		int boaGubun = bVO.getBoaGubun();
		int catePk = cateVO.getCatePk();
		String url = "/boardsRcntBestList.do?catePk=" + catePk +"&boaGubun="+boaGubun+"&?";
		int currentPage = 1;
		int totalCount = impl.svcBoardsBestCount(bVO);
		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		PagingUtil util = new PagingUtil(url, currentPage, totalCount, 5, 5);
		bVO.setCatePk(catePk);
		bVO.setSseq(util.getStartSeq());
		bVO.setEseq(util.getEndSeq());
		String html = util.getPagingHtml();
		ArrayList<BoardsVO> tempList = impl.svcBoardsRcntBestList(bVO);
		ArrayList<BoardsVO> boardsList2 = impl.svcBrList(tempList);
		mav.addObject("cateName", tempList.get(0).getCateName());
		mav.addObject("catePk", tempList.get(0).getCatePk());
		mav.addObject("confirm", "rcnt");
		mav.addObject("boaGubun", boaGubun);
		mav.addObject("boardsList", boardsList2);
		mav.addObject("PAGING", html);
		mav.setViewName("alone/community/alone_bestBoards");
			
		return mav;
	}

	@RequestMapping(value = "/showBoardsInsert.do")
	public ModelAndView showBoardsInsert(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		int catePk = Integer.parseInt(request.getParameter("catePk"));
		CategoriesVO vo = impl.svcSelectCateName(catePk);
		mav.addObject("catePk", catePk);
		mav.addObject("vo", vo);
		mav.setViewName("alone/community/alone_boardsInsert");
		return mav;
	}

	@RequestMapping(value = "/boardsUpload.do")
	public String file_uploader(HttpServletRequest request, HttpServletResponse response, BoardsVO editor) {
		String return1 = request.getParameter("callback");
		String return2 = "?callback_func=" + request.getParameter("callback_func");
		String return3 = "";
		String name = "";
		InputStream inStream = null;
	    OutputStream outStream = null;
		try {
			if (editor.getFiledata() != null && editor.getFiledata().getOriginalFilename() != null
					&& !editor.getFiledata().getOriginalFilename().equals("")) {
				name = editor.getFiledata().getOriginalFilename()
						.substring(editor.getFiledata().getOriginalFilename().lastIndexOf(File.separator) + 1);
				String filename_ext = name.substring(name.lastIndexOf(".") + 1);
				filename_ext = filename_ext.toLowerCase();
				String[] allow_file = { "jpg", "png", "bmp", "gif" };
				int cnt = 0;
				for (int i = 0; i < allow_file.length; i++) {
					if (filename_ext.equals(allow_file[i])) {
						cnt++;
					}
				}
				if (cnt == 0) {
					return3 = "&errstr=" + name;
				} else {
					// 파일 기본경로
					String dftFilePath = request.getSession().getServletContext().getRealPath("/");
					// 파일 기본경로 _ 상세경로
					String filePath = dftFilePath + "resources" + File.separator + "editor" + File.separator + "upload"
							+ File.separator;
					String filePath2 = "C:\\Users\\dmdel\\Desktop\\myworkspace\\springkang\\PROJECT_ALONE\\src\\main\\webapp\\resources\\editor\\upload\\";
					File file = new File(filePath);
					if (!file.exists()) {
						file.mkdirs();
					}
					String realFileNm = "";
					SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
					String today = formatter.format(new java.util.Date());
					realFileNm = today + UUID.randomUUID().toString() + name.substring(name.lastIndexOf("."));
					String rlFileNm = filePath + realFileNm;
					String rlFileNm2 = filePath2 + realFileNm;
					///////////////// 서버에 파일쓰기 /////////////////
					editor.getFiledata().transferTo(new File(rlFileNm));
					
				    inStream = new FileInputStream(rlFileNm); //원본파일
				    outStream = new FileOutputStream(rlFileNm2); //이동시킬 위치
				    byte[] buffer = new byte[1024];
				    int length;
				    while ((length = inStream.read(buffer)) > 0){
				        outStream.write(buffer, 0, length);
				        }
				    
					///////////////// 서버에 파일쓰기 /////////////////
					return3 += "&bNewLine=true";
					return3 += "&sFileName=" + name;
					return3 += "&sFileURL=/resources/editor/upload/" + realFileNm;
				}
			} else {
				return3 += "&errstr=error";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				inStream.close();
				outStream.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return "redirect:" + return1 + return2 + return3;

	}
	
	@RequestMapping(value = "/boardsInsert.do")
	public String test(HttpServletRequest request, BoardsVO bVO, CategoriesVO cVO, HttpSession session) {
		String smarteditor = request.getParameter("smarteditor");
		int monPk = (Integer) session.getAttribute("monPk");
//		int monPk = 1;//로그인세션
		try {
			int idx = smarteditor.indexOf("<img src=");		
			String test = smarteditor.substring(idx+10);
			int idx2 = test.indexOf("\"");
			String test2 = test.substring(0, idx2);
			bVO.setBoaUrl(test2);
			bVO.setMonPk(monPk);
			bVO.setBoaCon(smarteditor);
			int result = impl.svcBoardsInsert(bVO);
			if(result>0){
				bVO = impl.svcBoardsFirstRegdate();
				return "redirect:/boardsDetail.do?catePk="+bVO.getCatePk()+"&boaPk="+bVO.getBoaPk()+"&boaGubun="+bVO.getBoaGubun();    //작성한글 디테일 주소로 리턴
			}
			
		} catch (Exception e) {
			bVO.setMonPk(monPk);
			bVO.setBoaCon(smarteditor);
			int result = impl.svcBoardsInsert(bVO);
			if(result>0){
				bVO = impl.svcBoardsFirstRegdate();
				return "redirect:/boardsDetail.do?catePk="+bVO.getCatePk()+"&boaPk="+bVO.getBoaPk()+"&boaGubun="+bVO.getBoaGubun();    //작성한글 디테일 주소로 리턴
		}
		}
		return "redirect:/cateBoardsAllList.do?catePk="+bVO.getCatePk();
	}
		
	@RequestMapping(value = "/boardsUpdate.do")
	public String boardsUpdate(HttpServletRequest request, BoardsVO bVO, CategoriesVO cVO) {
		String smarteditor = request.getParameter("smarteditor");
		try {
			int idx = smarteditor.indexOf("<img src=");
			String test = smarteditor.substring(idx+10);
			int idx2 = test.indexOf("\"");
			String test2 = test.substring(0, idx2);
			bVO.setBoaUrl(test2);
			bVO.setBoaCon(smarteditor);
			int result = impl.svcBoardsUpdate(bVO);
			if(result>0){
				bVO = impl.svcBoardsFirstRegdate();
				return "redirect:/boardsDetail.do?catePk="+bVO.getCatePk()+"&boaPk="+bVO.getBoaPk()+"&boaGubun="+bVO.getBoaGubun();    //작성한글 디테일 주소로 리턴
			}
			
		} catch (Exception e) {
			bVO.setBoaCon(smarteditor);
			int result = impl.svcBoardsUpdate(bVO);
			if(result>0){
				bVO = impl.svcBoardsFirstRegdate();
				return "redirect:/boardsDetail.do?catePk="+bVO.getCatePk()+"&boaPk="+bVO.getBoaPk()+"&boaGubun="+bVO.getBoaGubun();    //작성한글 디테일 주소로 리턴
		}
		}
		return "redirect:/cateBoardsAllList.do?catePk="+bVO.getCatePk();
	}
	
	@RequestMapping(value = "/showBoardsUpdate.do")
	public ModelAndView showBoardsUpdate(HttpServletRequest request, BoardsVO bVO) {
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object>map = impl.svcBoardsDetail(bVO.getBoaPk());
		CategoriesVO vo = impl.svcSelectCateName(bVO.getCatePk());
		mav.addObject("vo", vo);
		mav.addObject("bVO", map.get("bVO"));
		mav.setViewName("alone/community/alone_boardsUpdate");
		return mav;
	}
	
	@RequestMapping(value = "/boardsDelete.do")
		public String showBoardsDelete(HttpServletRequest request, BoardsVO bVO) {
			impl.svcBoardsDelete(bVO.getBoaPk());
			if(bVO.getBoaGubun()==2||bVO.getBoaGubun()==3||bVO.getBoaGubun()==4||bVO.getBoaGubun()==5||bVO.getBoaGubun()==6){
				return"redirect:/bestBoardsList.do?catePk="+bVO.getCatePk()+"&boaGubun="+bVO.getBoaGubun();
			}
			return "redirect:/cateBoardsAllList.do?catePk="+bVO.getCatePk();
		}
	
	@RequestMapping(value = "/boardsDetail.do")
	public ModelAndView BoardsDetail(HttpServletRequest request, BoardsVO bVO, BoardScrapVO bsVO, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("boaGubun", bVO.getBoaGubun());
		HashMap<String, Object>map = impl.svcBoardsDetail(bVO.getBoaPk());
		int monPk = (Integer) session.getAttribute("monPk");
		bsVO.setMonPk(monPk); 	
		bsVO = impl.svcBoardsScrapSelect(bsVO);
		if(bsVO!=null){
			mav.addObject("scrapcall", true);
		}else if(bsVO==null){
			mav.addObject("scrapcall", false);
		}
		mav.addObject("rCnt", map.get("rCnt"));
		mav.addObject("cnt", map.get("cnt"));
		mav.addObject("rList", map.get("rList"));
		mav.addObject("bVO", map.get("bVO"));
		mav.setViewName("alone/community/alone_boardsDetail");
		return mav;
	}
		
		@RequestMapping(value = "/boardsSearch.do")
	public ModelAndView BoardsSearch(HttpServletRequest request, BoardsVO bVO, HttpServletResponse response) throws IOException {
		ModelAndView mav = new ModelAndView();
		int catePk = bVO.getCatePk();
		int boaGubun = 1;
		String test = request.getParameter("boardsSearch");
//		String url = "/boardsSearch.do?catePk=" + catePk +"&boaGubun="+boaGubun+"&?";
		String url = "/boardsSearch.do?boardsSearch="+test+"&catePk="+catePk+"&boaGubun="+boaGubun;
		int currentPage = 1;
		bVO.setBoaTitle(request.getParameter("boardsSearch"));
		int totalCount = impl.svcBoardsSearchAllCount(bVO);
		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		PagingUtil util = new PagingUtil(url, currentPage, totalCount, 5, 5);
		bVO.setCatePk(catePk);
		bVO.setSseq(util.getStartSeq());
		bVO.setEseq(util.getEndSeq());
		String html = util.getPagingHtml();
		ArrayList<BoardsVO> boardsList = impl.svcBoardsSearchAll(bVO);
		if(boardsList.size()<=0){
//			 response.setContentType("text/html; charset=UTF-8");
//	            PrintWriter out = response.getWriter();
//	            out.println("<script>alert('일치하는 검색어가 없습니다..'); history.go(-1);</script>");
//	            out.flush();
			mav.setViewName("alone/community/alone_boards");
			mav.addObject("catePk", catePk);
			mav.addObject("boardsList", boardsList);
		}else{
			mav.setViewName("alone/community/alone_boards");
			mav.addObject("cateName", boardsList.get(0).getCateName());
			mav.addObject("catePk", boardsList.get(0).getCatePk());
			mav.addObject("boardsList", boardsList);
			mav.addObject("PAGING", html);
		}
		return mav;
	}
		
		@RequestMapping(value = "/boardsSearchGubun.do")
		public ModelAndView BoardsSearchGubun(CategoriesVO cateVO, HttpServletRequest request, BoardsVO bVO) {
			ModelAndView mav = new ModelAndView();

			int boaGubun = bVO.getBoaGubun();
			int catePk = cateVO.getCatePk();
			String url = "/boardsSearchGubun.do?catePk=" + catePk + "&?";
			int currentPage = 1;
			bVO.setBoaTitle(request.getParameter("boardsSearch"));
			int totalCount = impl.svcBoardsSearchGubunCount(bVO);
			if (request.getParameter("currentPage") != null) {
				currentPage = Integer.parseInt(request.getParameter("currentPage"));
			}
			PagingUtil util = new PagingUtil(url, currentPage, totalCount, 5, 5);
			bVO.setCatePk(catePk);
			bVO.setSseq(util.getStartSeq());
			bVO.setEseq(util.getEndSeq());
			String html = util.getPagingHtml();
			ArrayList<BoardsVO> boardsList = impl.svcBoardsSearchGubun(bVO);
			if(boardsList.size()<=0){
//				 response.setContentType("text/html; charset=UTF-8");
//		            PrintWriter out = response.getWriter();
//		            out.println("<script>alert('일치하는 검색어가 없습니다..'); history.go(-1);</script>");
//		            out.flush();
				mav.setViewName("alone/community/alone_boards");
				mav.addObject("catePk", catePk);
				mav.addObject("boaGubun", boaGubun);
				mav.addObject("boardsList", boardsList);
			}else{
				mav.addObject("cateName", boardsList.get(0).getCateName());
				mav.addObject("catePk", boardsList.get(0).getCatePk());
				mav.addObject("boaGubun", boaGubun);
				mav.addObject("boardsList", boardsList);
				mav.addObject("PAGING", html);
				mav.setViewName("alone/community/alone_bestBoards");
			}
				
			return mav;
		}
	
		@RequestMapping(value="/replyInsert.do")
		@ResponseBody
		public ArrayList<ReplyVO> replyInsert(ReplyVO vo, HttpSession session){
			int monPk = (Integer) session.getAttribute("monPk");
			vo.setMonPk(monPk);//로그인세션
			impl.svcBoardsReplyInsert(vo);
			ArrayList<ReplyVO> rList = impl.svcBoardsReplyList(vo.getBoaPk());
			int rcnt = test.svcBoardsReplyCount(vo.getBoaPk());
			if(rcnt==0){
				return rList;
			}else if(rcnt!=0){
				rList.get(0).setRcnt(rcnt);
			}
			return rList;
		}
		
		@RequestMapping(value="/replyDelete.do")
		@ResponseBody
		public ArrayList<ReplyVO> replyDelete(ReplyVO vo){
			impl.svcBoardsReplyDelete(vo.getRepPk());
			ArrayList<ReplyVO> rList = impl.svcBoardsReplyList(vo.getBoaPk());
			int rcnt = test.svcBoardsReplyCount(vo.getBoaPk());
			if(rcnt==0){
				return rList;
			}else if(rcnt!=0){
				rList.get(0).setRcnt(rcnt);
			}
			return rList;
		}
		
		@RequestMapping(value="/boardsScrapInsert.do")
		@ResponseBody
		public int scrapInsert(BoardScrapVO vo, HttpSession session){
			int monPk = (Integer) session.getAttribute("monPk");
			vo.setMonPk(monPk);//로그인세션
			int cnt = impl.svcBoardsScrapInsert(vo);
			return cnt;
		}
		
		@RequestMapping(value="/boardsScrapDelete.do")
		@ResponseBody
		public int scrapDelete(BoardScrapVO bsVO, HttpSession session){
			int monPk = (Integer) session.getAttribute("monPk");
			bsVO.setMonPk(monPk);//로그인세션
			int cnt = impl.svcBoardsScrapDelete(bsVO);
			return cnt;
		}
	
		@RequestMapping(value="/geolocation.do")
		@ResponseBody
		public String geolocation(double lat, double lng){
			System.out.println("위도 :"+lat);
			System.out.println("경도 :"+lng);
			return "성공...!";
		}
			
		@RequestMapping(value = "/hot_board_scrap_page.do")
		public ModelAndView boardScrapPage(HttpServletRequest request, HttpSession session) {
			ModelAndView mav = new ModelAndView();
			BoardsVO vo = new BoardsVO();
			String url = "/hot_board_scrap_page.do?";
			int monPk = (Integer) session.getAttribute("monPk"); vo.setMonPk(monPk);
			int currentPage = 1;
			int totalCount = impl.svcMyBoardScrapCount(monPk);
			if (request.getParameter("currentPage") != null) {
				currentPage = Integer.parseInt(request.getParameter("currentPage"));
			}
			PagingUtil util = new PagingUtil(url, currentPage, totalCount, 5, 5);
			vo.setSseq(util.getStartSeq());
			vo.setEseq(util.getEndSeq());
			String html = util.getPagingHtml();
			ArrayList<BoardsVO> tempList = impl.svcBoardScrapList(vo);
			ArrayList<BoardsVO> boardsList2 = impl.svcBrList(tempList);
			MonstersVO mVO = impl.svcSelectMember(monPk);
			mav.setViewName("alone/information/alone_board_scrap");
			mav.addObject("mVO", mVO);
			mav.addObject("boardsList", boardsList2);
			mav.addObject("PAGING", html);
						
			return mav;
		
		}
		
}
