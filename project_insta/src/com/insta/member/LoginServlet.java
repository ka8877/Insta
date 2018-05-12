package com.insta.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/instaLogin")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.invalidate();
		response.sendRedirect("/insta/insta-login.jsp");
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("email");
		String password = request.getParameter("password");
		MemberImpl impl = new MemberImpl();
		MemberVO vo = new MemberVO();
		vo.setEmail(email);
		vo.setPassword(password);
		vo = impl.login(vo);

		if (vo.getName() == null) {
			response.sendRedirect("/insta/insta-login.jsp");
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("loginedUser", vo.getName());
			session.setAttribute("LVL_SESS_PASSWORD", vo.getPassword());
			session.setAttribute("LVL_SESS_EMAIL", vo.getEmail());
			session.setAttribute("LVL_SESS_USERNAME", vo.getUserName());
			session.setAttribute("mgubun", vo.getUserGubun());
			session.setAttribute("mseq", vo.getMseq());

			if (vo.getUserGubun() != null && vo.getUserGubun().equals("a")) {
				response.sendRedirect("/MemberListServlet");
			} else if (vo.getUserGubun() != null && vo.getUserGubun().equals("u")) {
				response.sendRedirect("/homeList");
			}
		}

	}

}
