package com.insta.follower;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.insta.hashtag.HashTagImpl;
import com.insta.member.MemberVO;

@WebServlet("/followInsert")
public class FollowInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String followGubun = request.getParameter("followGubun");
		int mseq = (int) request.getSession().getAttribute("mseq");
		int requesterSeq = Integer.parseInt(request.getParameter("requesterSeq"));
		
		HashTagImpl implH = new HashTagImpl();
		if(followGubun.equals("false")){				//팔로우추가
			implH.followInsert(mseq, requesterSeq);
			response.sendRedirect("/searchName?searchText=" +requesterSeq);
			
		}else if(followGubun.equals("true")){			//팔로우삭제
			implH.followdelete(mseq, requesterSeq);
			response.sendRedirect("/searchName?searchText=" +requesterSeq);

		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
