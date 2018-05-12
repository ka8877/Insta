package com.insta.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.insta.reportReply.ReportReplyImpl;
import com.insta.reportReply.ReportReplyVO;

//신고댓글관리페이지에서 [신고댓글삭제]
@WebServlet("/ReportReplyDeleteServlet")
public class ReportReplyDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ReportReplyVO vo = new ReportReplyVO();	
		ReportReplyImpl impl = new ReportReplyImpl();
		
		String seqVal = request.getParameter("rseq");
		int res = impl.ReportReplyDelete(Integer.parseInt(seqVal));
		
		if (res > 0) {
			response.sendRedirect("/ReportReplyServlet");
		}
		
	}
		
		
		
	}


