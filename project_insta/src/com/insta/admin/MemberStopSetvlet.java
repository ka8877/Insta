package com.insta.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.insta.reportMember.ReportMemberImpl;
import com.insta.reportMember.ReportMemberVO;

//신고회원관리페이지에서 [회원일시정지]
@WebServlet("/MemberStopSetvlet")
public class MemberStopSetvlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ReportMemberImpl impl = new ReportMemberImpl();
		
		String mseqVal = request.getParameter("mseq");
	
		int res = impl.ReportmemberUpdate(Integer.parseInt(mseqVal));
		
		if (res > 0) {
			response.sendRedirect("/ReportMemberListServlet");
			
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
