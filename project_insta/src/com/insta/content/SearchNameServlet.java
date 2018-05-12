package com.insta.content;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.insta.follower.FollowerVO;
import com.insta.hashtag.HashTagImpl;
import com.insta.member.MemberVO;

@WebServlet("/searchName")
public class SearchNameServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//팔로우 신청과 이름클릭시에는 겟 일반적인 검색은 포스트로 온다.
		String loginedUser = (String) request.getSession().getAttribute("loginedUser");
		int mseq = (int) request.getSession().getAttribute("mseq");
		
		HashTagImpl implH = new HashTagImpl();
		MemberVO vo = implH.memberDetail(Integer.parseInt(request.getParameter("searchText")));
		String searchName = vo.getName();
		if(searchName.contains("#") == false){
			ArrayList<ContentVO> list = implH.selectContentName(searchName);
			MemberVO vo2 = implH.memberDetail(searchName);
			
			int contentCnt = implH.selectContentNameCount(searchName);
			int followerCnt = implH.followerCount(vo2.getMseq());
			int requesterCnt = implH.requesterCount(vo2.getMseq());
			
			request.setAttribute("followerCnt", followerCnt);
			request.setAttribute("requesterCnt", requesterCnt);
			request.setAttribute("contentCnt", contentCnt);
			request.setAttribute("list", list);
			String name = list.get(0).getMemberName();
			request.setAttribute("requesterSeq", list.get(0).getMseq());
			request.setAttribute("name", name);
			
			ArrayList<MemberVO> listM = new ArrayList<>();
			listM = implH.memberList();
			ArrayList<String> listName = new ArrayList<>();
			for(int i=0; i<listM.size(); i++ ){
				listName.add(listM.get(i).getName());
			}
			
			ArrayList<FollowerVO> listF = implH.followerList(mseq);
			boolean res = false;				//이미 친구면 true, 친구가 아니면false
			for(int r=0; r<listF.size(); r++){
				listF.get(r).getRequesterSeq();
				if(listF.get(r).getRequesterSeq() == list.get(0).getMseq()){
				 res = true;
				 if(res == true) {
					 break;
				 }
				 }
				
			}
			MemberVO voM = implH.memberDetail(mseq);
			request.setAttribute("followGubun", res);
			request.setAttribute("voM", voM);
			request.setAttribute("listName", listName);
			
			RequestDispatcher rd = request.getRequestDispatcher("/insta/insta-searchName.jsp");
			rd.forward(request, response);
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//팔로우는 겟 일반적인 검색은 포스트로 온다.
		String loginedUser = (String) request.getSession().getAttribute("loginedUser");
		int mseq = (int) request.getSession().getAttribute("mseq");
		
		HashTagImpl implH = new HashTagImpl();
		String searchName = request.getParameter("searchText");
		if(searchName.contains("#") == false){
			ArrayList<ContentVO> list = implH.selectContentName(searchName);
			MemberVO vo2 = implH.memberDetail(searchName);
			int contentCnt = implH.selectContentNameCount(searchName);
			int followerCnt = implH.followerCount(vo2.getMseq());
			int requesterCnt = implH.requesterCount(vo2.getMseq());
			
			request.setAttribute("followerCnt", followerCnt);
			request.setAttribute("requesterCnt", requesterCnt);
			request.setAttribute("contentCnt", contentCnt);
			request.setAttribute("list", list);
			String name = list.get(0).getMemberName();
			request.setAttribute("requesterSeq", list.get(0).getMseq());
			request.setAttribute("name", name);
			
			ArrayList<MemberVO> listM = new ArrayList<>();
			listM = implH.memberList();
			ArrayList<String> listName = new ArrayList<>();
			for(int i=0; i<listM.size(); i++ ){
				listName.add(listM.get(i).getName());
			}
			
			ArrayList<FollowerVO> listF = implH.followerList(mseq);
			boolean res = false;				//이미 친구면 true, 친구가 아니면false
			for(int r=0; r<listF.size(); r++){
				listF.get(r).getRequesterSeq();
				if(listF.get(r).getRequesterSeq() == list.get(0).getMseq()){
				 res = true;
				 if(res == true) {
					 break;
				 }
				 }
				
			}
			MemberVO voM = implH.memberDetail(mseq);
			request.setAttribute("followGubun", res);
			request.setAttribute("voM", voM);
			request.setAttribute("listName", listName);
			
			RequestDispatcher rd = request.getRequestDispatcher("/insta/insta-searchName.jsp");
			rd.forward(request, response);
			
		}else if(searchName.contains("#") == true){
			ArrayList<ContentVO> list = implH.selectHashTagName(searchName);
			int contentHCnt = implH.selectContentHashtagCount(searchName);
			request.setAttribute("contentHCnt", contentHCnt);
			request.setAttribute("list", list);
			request.setAttribute("searchName", searchName);
			
			ArrayList<MemberVO> listM = new ArrayList<>();
			listM = implH.memberList();
			ArrayList<String> listName = new ArrayList<>();
			for(int i=0; i<listM.size(); i++ ){
				listName.add(listM.get(i).getName());
			}
			request.setAttribute("listName", listName);
			
			RequestDispatcher rd = request.getRequestDispatcher("/insta/insta-searchHashtag.jsp");
			rd.forward(request, response);
		}
	}

}
