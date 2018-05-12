package com.insta.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.insta.member.MemberImpl;
import com.insta.reportMember.ReportMemberImpl;

//신고회원관리페이지[신고회원탈퇴]
@WebServlet("/ReportMemberDeleteServlet")
public class ReportMemberDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
					
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ReportMemberImpl impl = new ReportMemberImpl();
		String mseqVal = request.getParameter("mseq");   	
		MemberImpl implM = new MemberImpl();
		 impl.ReportmemberDelete(Integer.parseInt(mseqVal));
		 implM.memberDelete(Integer.parseInt(mseqVal));
		response.sendRedirect("/ReportMemberListServlet");
			
		
			

		
	

		
		
		
	}

}
