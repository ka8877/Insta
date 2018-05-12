package com.insta.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.insta.member.MemberImpl;
import com.insta.member.MemberVO;
//import com.insta.reportMember.ReportMemberImpl;

//신고회원내역페이지서블릿 [신고회원상세보기]버튼눌렀을때서블릿
@WebServlet("/ReportDetailMemberList")
public class ReportDetailMemberList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String loginedUser = (String) request.getSession().getAttribute("loginedUser");  //관리자로그인정보를 세션에담아놓고 
		int mseq = (int) request.getSession().getAttribute("mseq");
		
		
		MemberImpl implM = new MemberImpl();
		
		String mseqVal = request.getParameter("mseq"); //mseq를받아와서 여기서 상세보기버튼누르면창띄운다.
		
		MemberVO  vo = new MemberVO();
		vo =implM.memberDetail(Integer.parseInt(mseqVal));
		
		request.setAttribute("DETAIL_VO", vo);
		RequestDispatcher rd =request.getRequestDispatcher("/insta/detailMember.jsp");
		rd.forward(request, response);
		
		
		
		
		
		
		
		
		
		
		//ArrayList<MemberVO> list = impl.DetailMemberList(Integer.parseInt(mseqVal));
//		ArrayList<JoinVo> list = impl.JoinMemberList(Integer.parseInt(mseqVal));
//		
//	
//		request.setAttribute("DETAIL_LIST", list);	
//		RequestDispatcher rd =request.getRequestDispatcher("/insta/detailMember.jsp");
//		rd.forward(request, response);
//		
//		
		

		
		
		
		


		
		
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
