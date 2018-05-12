package com.insta.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.insta.reportContent.ReportContentImpl;
import com.insta.reportContent.ReportContentVO;

//탭 =신고게시글관리페이지서블릿
@WebServlet("/ReportConListServlet")
public class ReportConListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String loginedUser = (String) request.getSession().getAttribute("loginedUser");  //관리자로그인정보를 세션에담아놓고 
		int mseq = (int) request.getSession().getAttribute("mseq");
		
			ReportContentImpl impl = new ReportContentImpl();
			ArrayList<ReportContentVO> list = impl.conList();
			request.setAttribute("I_LIST4", list);	
			RequestDispatcher rd = request.getRequestDispatcher("/insta/contentList.jsp");
			rd.forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
