package com.insta.hashtag;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.insta.content.ContentVO;
import com.insta.member.MemberVO;

@WebServlet("/searchHashtag")
public class SearchHashtag extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String hashtag = request.getParameter("aHashtag");
		HashTagImpl impl = new HashTagImpl();
		ArrayList<ContentVO> list = impl.selectHashTagName(hashtag);
		int contentHCnt = impl.selectContentHashtagCount(hashtag);
		request.setAttribute("contentHCnt", contentHCnt);
		request.setAttribute("list", list);
		String name = list.get(0).getMemberName();
		request.setAttribute("name", name);
		request.setAttribute("searchName", hashtag);
		
		ArrayList<MemberVO> listM = new ArrayList<>();
		listM = impl.memberList();
		ArrayList<String> listName = new ArrayList<>();
		for(int i=0; i<listM.size(); i++ ){
			listName.add(listM.get(i).getName());
		}
		request.setAttribute("listName", listName);
		
		RequestDispatcher rd = request.getRequestDispatcher("/insta/insta-searchHashtag.jsp");
		rd.forward(request, response);
		
	}

}
