package com.insta.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.insta.member.MemberImpl;
import com.insta.member.MemberVO;

//텝 =가입회원내역페이지
@WebServlet("/MemberListServlet")
public class MemberListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String loginedUser = (String) request.getSession().getAttribute("loginedUser");  //관리자로그인정보를 세션에담아놓고 
//		int mseq = (int) request.getSession().getAttribute("mseq");
		
			MemberImpl impl = new MemberImpl();
			ArrayList<MemberVO> list = impl.memberList();
			
			request.setAttribute("I_LIST1", list);
			request.setAttribute("loginedUser", loginedUser);
			RequestDispatcher rd =request.getRequestDispatcher("/insta/mJoinList.jsp");
			rd.forward(request, response);
			
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		PrintWriter out = response.getWriter();
//		String INSTA = request.getParameter("INSTA");
//		
//		if(INSTA.equals("LIST")){
//			response.sendRedirect("/MemberListServlet?INSTA=LIST");
		//response.sendRedirect("/project_insta/MemberListServlet");
//			
//		}
	}

}
