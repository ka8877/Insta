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
//탭 = 신고회원관리서블릿페이지
@WebServlet("/ReportMemberListServlet")
public class ReportMemberListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    	

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String loginedUser = (String) request.getSession().getAttribute("loginedUser");  //관리자로그인정보를 세션에담아놓고 
		int mseq = (int) request.getSession().getAttribute("mseq");
		
			ReportMemberImpl impl = new ReportMemberImpl();
			ArrayList<ReportMemberVO> list = impl.ReportmemberList();
			request.setAttribute("I_LIST5", list);	
			request.setAttribute("loginedUser", loginedUser);
			RequestDispatcher rd = request.getRequestDispatcher("/insta/cancelMember.jsp");
			rd.forward(request, response);
			
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		
	}

}
