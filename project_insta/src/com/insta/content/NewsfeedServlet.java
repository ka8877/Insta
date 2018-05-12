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
import com.insta.reply.ReplyVO;

@WebServlet("/newfeedList")
public class NewsfeedServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String loginedUser = (String) request.getSession().getAttribute("loginedUser");
		int mseq = (int) request.getSession().getAttribute("mseq");
		request.setAttribute("loginedUser", loginedUser);
		
		HashTagImpl impl = new HashTagImpl();
		ArrayList<FollowerVO> list = impl.myFollowerList(mseq);
			request.setAttribute("list", list);
			
			ArrayList<MemberVO> listM = new ArrayList<>();
			listM = impl.memberList();
			
			ArrayList<String> listName = new ArrayList<>();
			for(int i=0; i<listM.size(); i++ ){
				listName.add(listM.get(i).getName());
			}
			request.setAttribute("listName", listName);
			
			RequestDispatcher rd = request.getRequestDispatcher("/insta/insta-newsfeed.jsp");
			rd.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
