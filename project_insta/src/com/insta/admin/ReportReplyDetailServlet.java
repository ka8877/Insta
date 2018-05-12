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
import com.insta.reportReply.ReportReplyVO;

//신고댓글관리페이지에서 [신고댓글상세보기] 서블릿
@WebServlet("/ReportReplyDetailServlet")
public class ReportReplyDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String loginedUser = (String) request.getSession().getAttribute("loginedUser");  //관리자로그인정보를 세션에담아놓고 
		
		ReportReplyImpl impl = new ReportReplyImpl();
		
		String rseqVal = request.getParameter("rseq");
		ReportReplyVO vo = new ReportReplyVO();
		vo = impl.JoinReportReplyDetail(Integer.parseInt(rseqVal));  //신고댓글에관한상세보기
		
		request.setAttribute("REPLY_VO", vo);	           //댓글상세보기jsp로
		RequestDispatcher rd =request.getRequestDispatcher("/insta/replyReportDetail.jsp");
		rd.forward(request, response);
	}

}
