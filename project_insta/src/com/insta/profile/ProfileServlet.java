package com.insta.profile;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.insta.content.ContentImpl;
import com.insta.content.ContentVO;
import com.insta.follower.FollowerVO;
import com.insta.hashtag.HashTagImpl;
import com.insta.member.MemberImpl;
import com.insta.member.MemberVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/ProfileServlet")
public class ProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	int my_picture_max_size;
	String my_picture_path;
	String my_picture_format;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ACTIONSTR = request.getParameter("ACTIONSTR");
			if( ACTIONSTR == null ||ACTIONSTR.equals("LIST")){
				HttpSession session = request.getSession();
				String loginedUser = (String) session.getAttribute("loginedUser");
				int mseq = (int) session.getAttribute("mseq");
				
				HashTagImpl implH = new HashTagImpl();
				int followerCnt = implH.followerCount(mseq);
				int requesterCnt = implH.requesterCount(mseq);
				
				ArrayList<FollowerVO> followerList = implH.myFollowerList(mseq);
				ArrayList<FollowerVO> requesterList = implH.myRequesterList(mseq);
					request.setAttribute("requesterList", requesterList);
					request.setAttribute("followerList", followerList);
					request.setAttribute("loginedUser", loginedUser);
				request.setAttribute("followerCnt", followerCnt);
				request.setAttribute("requesterCnt", requesterCnt);
				
			MemberVO vo = new MemberVO();
			ProfileVO pvo =new ProfileVO();
			MemberImpl impl = new MemberImpl();
			ProfileImpl pImpl = new ProfileImpl();
			
			session.getAttribute("LVL_SESS_USERNAME");
			ContentImpl impl2 = new ContentImpl();
			ArrayList<ContentVO> list = new ArrayList<>();
			int count;
			count = impl2.myContentCount(mseq);
			request.setAttribute("count", count);
			list = impl2.myContentList(mseq);
			request.setAttribute("list", list);
			pvo = pImpl.myPictureDetail(mseq); 
		
			request.setAttribute("pvo", pvo);
			RequestDispatcher rd = request.getRequestDispatcher("/insta/insta-profile.jsp");
			rd.forward(request, response);
			} else if(ACTIONSTR.equals("PROFILE")){
				MemberVO vo = new MemberVO();
				ProfileVO vo2 = new ProfileVO();
				MemberImpl impl = new MemberImpl();
				ProfileImpl impl2 = new ProfileImpl();
				HttpSession session = request.getSession();
				int mseq = (int) session.getAttribute("mseq");
				
				vo = impl.memberDetail2(mseq);
				request.setAttribute("vo", vo);
				vo2 = impl2.profileDetail(mseq);
				request.setAttribute("vo2", vo2);
				RequestDispatcher rd = request.getRequestDispatcher("/insta/profileUpdate.jsp");
				rd.forward(request, response);
			}  else if(ACTIONSTR.equals("PASSWORD")){
				MemberVO vo = new MemberVO();
				MemberImpl impl = new MemberImpl();
				HttpSession session = request.getSession();
				int mseq = (int) session.getAttribute("mseq");
				
				vo = impl.passwordDetail(mseq);
				request.setAttribute("password", vo);
				
				RequestDispatcher rd = request.getRequestDispatcher("/insta/passwordUpdate.jsp");
				rd.forward(request, response);
			}  else if(ACTIONSTR.equals("MEMDELETE")){
				MemberVO vo = new MemberVO();
				MemberImpl impl = new MemberImpl();
				HttpSession session = request.getSession();
				int mseq = (int) session.getAttribute("mseq");			
				
				vo = impl.passwordDetail(mseq);
				request.setAttribute("password", vo);

				RequestDispatcher rd = request.getRequestDispatcher("/insta/member-delete.jsp");
				rd.forward(request, response);
			}
		
	}		

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String ACTIONSTR = request.getParameter("ACTIONSTR");
				if(ACTIONSTR.equals("UPDATE")){
	
					MemberVO vo = new MemberVO();
					MemberImpl impl = new MemberImpl();
					ProfileVO vo2 = new ProfileVO();
					ProfileImpl impl2 = new ProfileImpl();
					HttpSession session = request.getSession();
					int mseq = (int) session.getAttribute("mseq");
					
					//1. jsp파일에서 얻은 자료들 vo.set해주기 - 3개씩 잘 나눠서 
					//2. set으로 받은 vo들을 update 메소드 태우기 
					//3. 결과값 뿌려주는 거 확인. 
					String nameVal = request.getParameter("name");
					String userNameVal = request.getParameter("username");
					String emailVal = request.getParameter("email");
		
					//-------------------------------------------------------------vo
					String webSiteVal = request.getParameter("website");
					String introVal = request.getParameter("intro");
					String genderVal = request.getParameter("gender");
					//-------------------------------------------------------------vo2
					vo.setName(nameVal);
					vo.setUserName(userNameVal);
					vo.setEmail(emailVal);
					vo.setMseq(mseq);
	
					vo2.setWebsite(webSiteVal);
					vo2.setIntro(introVal);
					vo2.setGender(genderVal);
					vo2.setMseq(mseq);
					
				    impl2.profileUpdate(vo);
					impl2.profileUpdate2(vo2);

					request.setAttribute("vo", vo);
					request.setAttribute("vo2", vo2);

					RequestDispatcher rd = request.getRequestDispatcher("/insta/profileUpdate.jsp");
					rd.forward(request, response);
				}
				else if(ACTIONSTR.equals("PASSUPDATE")){
					
					MemberVO vo = new MemberVO();
					MemberImpl impl = new MemberImpl();
					 HttpSession session = request.getSession();
					 session.getAttribute("LVL_SESS_PASSWORD");
//					 String passVal = request.getParameter("password");
					 int mseq = (int) session.getAttribute("mseq");
					 String confirmVal = request.getParameter("confirm");
					 vo.setPassword(confirmVal);
					 vo.setMseq(mseq);
					 
					 impl.passwordUpdate(vo);
					 
					 session.setAttribute("LVL_SESS_PASSWORD", confirmVal);
					 
					 RequestDispatcher rd = request.getRequestDispatcher("/insta/passwordUpdate.jsp");
					 rd.forward(request, response);
					 }
				}
					 


	}   





