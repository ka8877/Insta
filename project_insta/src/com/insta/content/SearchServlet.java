package com.insta.content;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.insta.hashtag.HashTagImpl;
import com.insta.member.MemberVO;

@WebServlet("/searchList")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		String loginedUser = (String) request.getSession().getAttribute("loginedUser");
//		int mseq = (int) request.getSession().getAttribute("mseq");
		
		HashTagImpl implH = new HashTagImpl();
		ArrayList<ContentVO> list = new ArrayList<>();
		ArrayList<MemberVO> listM = new ArrayList<>();
		list = implH.contentList();
		listM = implH.memberList();
		
		ArrayList<String> listName = new ArrayList<>();
		for(int i=0; i<listM.size(); i++ ){
			listName.add(listM.get(i).getName());
		}
		request.setAttribute("listName", listName);
		request.setAttribute("list", list);
		RequestDispatcher rd = request.getRequestDispatcher("/insta/insta-search.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
