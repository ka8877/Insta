package com.insta.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/MemberInsertServlet")
public class MemberInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		
		
		 MemberImpl impl = new MemberImpl();
		 MemberVO vo = new MemberVO();
		 vo.setEmail(email);
		 vo.setName(name);
		 vo.setUserName(userName);
		 vo.setPassword(password);
		 int res = impl.memberInsert(vo); 
		 impl.profileInsert(res);
		 
		 response.sendRedirect("/insta/insta-login.jsp");
		
	}

}
