package com.insta.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.insta.reportMember.ReportMemberImpl;

@WebServlet("/MemberOnSetvlet")
public class MemberOnSetvlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ReportMemberImpl impl = new ReportMemberImpl();	
		String mseqVal = request.getParameter("mseq");
		int res = impl.OnReportmemberUpdate(Integer.parseInt(mseqVal));
			response.sendRedirect("/ReportMemberListServlet");
			
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
