package com.insta.profile;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.insta.content.ContentImpl;
import com.insta.content.ContentVO;
import com.insta.hashtag.HashTagImpl;
import com.insta.hashtag.HashTagVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/insertProfile")
public class InsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	int upload_file_max_size = 1000000;
	String upload_file_dir = "C:\\Users\\dmdel\\Desktop\\kang2\\project_insta\\webapp\\insta\\instaImage";
	
	String upload_file_format = "UTF-8";
	
	public InsertServlet() {
		super();
	}
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int mseq = (int) session.getAttribute("mseq");	
		ProfileImpl impl = new ProfileImpl();
		ProfileVO vo = new ProfileVO();
		vo.setMseq(mseq);
		impl.pictureDelete(vo);
		response.sendRedirect("/ProfileServlet");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MultipartRequest mRequest = new MultipartRequest(request, upload_file_dir, upload_file_max_size, upload_file_format,
				new DefaultFileRenamePolicy());
		
		String input_file = mRequest.getFilesystemName("file");				//업로드 사진 이름

//		String txt = mRequest.getParameter("txt");										//인서트 내용 전체
//		String hashtagList = mRequest.getParameter("hashtag");						//인서트 해시태그만 자른부분
		 HttpSession session = request.getSession();
		int mseq = (int) session.getAttribute("mseq");		//로그인 세션 아이디 받기...
		
		String fullPath = upload_file_dir + "\\" + input_file;
		File file = new File(fullPath);
		ProfileImpl impl = new ProfileImpl();
		ProfileVO vo = new ProfileVO();
		vo.setMyPictureName(input_file);
		vo.setMyPicturePath(upload_file_dir);
		vo.setMseq(mseq);
		impl.pictureUpdate(vo);
		
//		String[] hashtagList2 = hashtagList.split(",");				// hashtagList2는 해시태그를 콤마로 잘라서 배열로만듬
//		for(int i=0; i<hashtagList2.length; i++){
//			HashTagVO voH = new HashTagVO();
//			voH.setHashtagName(hashtagList2[i]);
//			impl.hashtagInsert(voH);
//		}
		
		response.sendRedirect("/ProfileServlet");
		}
	

}
