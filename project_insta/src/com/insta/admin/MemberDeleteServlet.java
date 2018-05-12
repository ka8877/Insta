package com.insta.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.insta.member.MemberImpl;


//가입회원내역 페이지에있는[회원삭제]
@WebServlet("/MemberDeleteServlet")
public class MemberDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		MemberImpl impl = new MemberImpl();  //회원impl
		
		String mseqVal = request.getParameter("mseq");
		impl.memberDelete(Integer.parseInt(mseqVal));  //회원삭제메서드
		
			response.sendRedirect("/MemberListServlet");	
		
	}

}
