package com.insta.content;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.insta.hashtag.HashTagImpl;
import com.insta.member.MemberVO;
import com.insta.reply.ReplyImpl;
import com.insta.reply.ReplyVO;

@WebServlet("/searchDetail")
public class SearchDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cseq = Integer.parseInt(request.getParameter("cseq"));
		ContentVO vo = new ContentVO();
		ArrayList<MemberVO> list = new ArrayList<>();
		HashTagImpl implH = new HashTagImpl();
		ArrayList<ReplyVO> replyList = new ArrayList<>();
		
		replyList = implH.replyList(cseq);
		list = implH.memberList();
		
		ArrayList<String> listName = new ArrayList<>();
		for(int i=0; i<list.size(); i++ ){
			listName.add(list.get(i).getName());
		}
		vo = implH.contentDetail(cseq);

		String hashtagSplit = vo.getHashtagList();
		String hashtagSplit2[] = hashtagSplit.split(",");
		ArrayList<String> hashtags = new ArrayList<>();
		for(int i=0; i<hashtagSplit2.length; i++){
			hashtags.add(hashtagSplit2[i]);
		}
		
		request.setAttribute("hashtags", hashtags);
		request.setAttribute("replyList", replyList);
		request.setAttribute("listName", listName);
		request.setAttribute("vo", vo);
		RequestDispatcher rd = request.getRequestDispatcher("/insta/insta-searchDetail.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
