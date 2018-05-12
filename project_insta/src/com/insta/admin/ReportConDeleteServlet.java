package com.insta.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.insta.content.ContentImpl;
import com.insta.reportContent.ReportContentImpl;

//신고게시글관리페이지에서 [게시글삭제]
@WebServlet("/ReportConDeleteServlet")
public class ReportConDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ReportContentImpl impl = new ReportContentImpl();  //게시물 impl
		
		ContentImpl implM = new ContentImpl();  //  <<==이거 신고게시물로
		String cseqVal = request.getParameter("cseq");
		
		int res = impl.reportConDelete(Integer.parseInt(cseqVal));  //게시물삭제메서드
		
		int resM = implM.contentDelete(Integer.parseInt(cseqVal));   //  <<==이거 신고게시물로

		if (resM >0 || res>0) {
			
			response.sendRedirect("/ReportConListServlet");
		}
		
		
		
	}

}
