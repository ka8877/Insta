package com.insta.content;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.insta.hashtag.HashTagImpl;
import com.insta.hashtag.HashTagVO;
import com.insta.member.MemberVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/insertContent")
public class InsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	int upload_file_max_size = 1000000000;
	String upload_file_dir = "C:\\Users\\dmdel\\Desktop\\kang2\\project_insta\\webapp\\insta\\instaImage";
	String upload_file_format = "UTF-8";
	
	public InsertServlet() {
		super();
	}
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HashTagImpl implH = new HashTagImpl();
		ArrayList<ContentVO> list = new ArrayList<>();
		ArrayList<MemberVO> listM = new ArrayList<>();
		list = implH.contentList();
		listM = implH.memberList();
		
		ArrayList<String> listName = new ArrayList<>();
		for(int i=0; i<listM.size(); i++ ){
			listName.add(listM.get(i).getName());
		}
		request.setAttribute("listName", listName);
		request.setAttribute("list", list);
		
		RequestDispatcher rd = request.getRequestDispatcher("/insta/insta-insert.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int mseq = (int) request.getSession().getAttribute("mseq");
		
		MultipartRequest mRequest = new MultipartRequest(request, upload_file_dir, upload_file_max_size, upload_file_format,
				new DefaultFileRenamePolicy());
		
		String input_file = mRequest.getFilesystemName("input_file");				//업로드 사진 이름
		String txt = mRequest.getParameter("txt");										//인서트 내용 전체
		String hashtagList = mRequest.getParameter("hashtag");						//인서트 해시태그만 자른부분
		String googleMap = mRequest.getParameter("searchGoogle");
		
		String fullPath = upload_file_dir + "\\" + input_file;
		File file = new File(fullPath);
		HashTagImpl impl = new HashTagImpl();
		ContentVO voC = new ContentVO();
		voC.setCon(txt);
		voC.setFileName(input_file);
		voC.setFilePath(upload_file_dir);
		voC.setMseq(mseq);
		voC.setHashtagList(hashtagList);
		voC.setLocation(googleMap);
		impl.contentInsert(voC);
		
		String[] hashtagList2 = hashtagList.split(",");				// hashtagList2는 해시태그를 콤마로 잘라서 배열로만듬
		for(int i=0; i<hashtagList2.length; i++){
			HashTagVO voH = new HashTagVO();
			voH.setHashtagName(hashtagList2[i]);
			impl.hashtagInsert(voH);
		}
		
		response.sendRedirect("/searchList");
		
	}

}
