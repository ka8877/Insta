package com.insta.hashtag;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/test91")
public class TestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("포스트콜");
		String ha = request.getParameter("place");
		String ha2 = request.getParameter("location");
		String ha3 = request.getParameter("searchGoogle");
		System.out.println(ha + "소환");
		System.out.println(ha2  + "소환2");
		System.out.println(ha3);
		
	}

}
