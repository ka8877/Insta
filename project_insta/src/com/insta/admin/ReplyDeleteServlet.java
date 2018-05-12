package com.insta.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.insta.reply.ReplyImpl;
import com.insta.reply.ReplyVO;
import com.insta.reportReply.ReportReplyImpl;


//신고댓글관리페이지에서 [댓글삭제]
@WebServlet("/ReplyDeleteServlet")
public class ReplyDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		ReplyImpl impl = new ReplyImpl();  //댓글impl

		ReportReplyImpl implM = new ReportReplyImpl();  //신고댓글impl
		String seqVal = request.getParameter("rseq");
		
		int res = impl.ReplyDelete(Integer.parseInt(seqVal));  //댓글삭제메서드
		int resM = implM.ReportReplyDelete(Integer.parseInt(seqVal));   //신고댓글삭제메서드
			
			response.sendRedirect("/ReportReplyServlet");

		}
	}
		
	


