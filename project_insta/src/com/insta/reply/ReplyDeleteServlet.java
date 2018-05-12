package com.insta.reply;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.insta.hashtag.HashTagImpl;

@WebServlet("/replyDelete")
public class ReplyDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int rseq = Integer.parseInt(request.getParameter("rseq"));
		int cseq = Integer.parseInt(request.getParameter("cseq"));
		HashTagImpl impl = new HashTagImpl();
		impl.replyDelete(rseq);
		response.sendRedirect("/searchDetail?cseq="+cseq);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
