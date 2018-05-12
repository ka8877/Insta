package com.insta.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.insta.reportMember.ReportMemberImpl;
import com.insta.reportMember.ReportMemberVO;
//탭 =신고회원내역서블릿
@WebServlet("/ReportMember")
public class ReportMember extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String loginedUser = (String) request.getSession().getAttribute("loginedUser");  //관리자로그인정보를 세션에담아놓고 
		int mseq = (int) request.getSession().getAttribute("mseq");
		
		ReportMemberImpl impl = new ReportMemberImpl();
		ArrayList<ReportMemberVO> list = impl.ReportmemberList();
		request.setAttribute("I_LIST2", list);
		request.setAttribute("loginedUser", loginedUser);
		RequestDispatcher rd = request.getRequestDispatcher("/insta/reportUser.jsp");
		rd.forward(request, response);
		
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
