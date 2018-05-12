package com.insta.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/MemberDeleteServlet2")
public class MemberDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int mseq = (int) session.getAttribute("mseq");	
		
		 MemberImpl impl = new MemberImpl();
		 MemberVO vo = new MemberVO();
		 impl.memberDelete(mseq);
		 
		 session.invalidate();
		 response.sendRedirect("/insta/login.jsp");
		
	}

}
