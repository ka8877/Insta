package com.insta.reply;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.insta.hashtag.HashTagImpl;

@WebServlet("/replyInsert")
public class ReplyInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cseq = Integer.parseInt(request.getParameter("cseq"));
		String replyCon = request.getParameter("replyCon");
		String kang = request.getParameter("kang");
		int mseq = 1;//세션 로그인부분.
		
		ReplyVO vo = new ReplyVO();
		vo.setCseq(cseq);
		vo.setReplyCon(replyCon);
		vo.setMseq(mseq);
		HashTagImpl impl = new HashTagImpl();
		int result = impl.replyInsert(vo);
		if(result>0 && kang.equals("detailReply")){
			response.sendRedirect("/searchDetail?cseq="+cseq);
			
		}else if(result>0 && kang.equals("homeReply")){
			response.sendRedirect("/homeList");
		}
		
	}

}
