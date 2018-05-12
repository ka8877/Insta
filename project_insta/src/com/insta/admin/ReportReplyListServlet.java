package com.insta.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.insta.reply.ReplyVO;
import com.insta.reportReply.ReportReplyImpl;
import com.insta.reportReply.ReportReplyVO;

//탭 = 신고댓글관리서블릿페이지
@WebServlet("/ReportReplyServlet")
public class ReportReplyListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String loginedUser = (String) request.getSession().getAttribute("loginedUser");  //관리자로그인정보를 세션에담아놓고 

			ReportReplyImpl impl = new ReportReplyImpl();
			ArrayList<ReportReplyVO> list = impl.ReportReplyList();
			ArrayList<ReplyVO>list1 = impl.ReplyReportList();
			request.setAttribute("I_LIST3", list1);
			request.setAttribute("I_LIST3", list);
			request.setAttribute("loginedUser", loginedUser);
			RequestDispatcher rd = request.getRequestDispatcher("/insta/replyList.jsp");
			rd.forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		
	}

}
