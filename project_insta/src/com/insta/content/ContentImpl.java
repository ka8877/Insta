package com.insta.content;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.insta.db.DBConnect;

public class ContentImpl {


	public int contentCount() { 
		Connection conn = null; 
		PreparedStatement pstmt = null; 
		ResultSet rs = null; 
		DBConnect db = new DBConnect(); 
		int cnt = 0; 
		String sql = "select count(*) cnt from content"; 
		try { 
			conn = db.dbConn(); 
			pstmt = conn.prepareStatement(sql); 
			rs = pstmt.executeQuery(); 
			if(rs.next()) { 
				cnt  = rs.getInt("cnt"); 
			} 
		} catch (SQLException e) { 
			e.printStackTrace(); 
		} finally {
			db.dbClose(rs, pstmt, conn); 
		} 
		return cnt; 
	} 
	//자기 게시물수
	public int myContentCount(int mseq) { 
		Connection conn = null; 
		PreparedStatement pstmt = null; 
		ResultSet rs = null; 
		DBConnect db = new DBConnect(); 
		int cnt = 0; 
		String sql = "select count(*) cnt from content where mseq=?"; 
		try { 
			conn = db.dbConn(); 
			pstmt = conn.prepareStatement(sql); 
			pstmt.setInt(1, mseq);
			rs = pstmt.executeQuery(); 
			if(rs.next()) { 
				cnt  = rs.getInt("cnt"); 
			} 
		} catch (SQLException e) { 
			e.printStackTrace(); 
		} finally { 
			db.dbClose(rs, pstmt, conn); 
		} 
		return cnt; 
	} 

	
	public ArrayList<ContentVO> myContentList(int mseq) {
		String sql = "select c.cseq,c.con,c.con_gubun,m.mseq,c.file_path,c.file_name,c.regdate,m.name from content c, member m where c.mseq = m.mseq and m.mseq=? ORDER by regdate desc";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBConnect db = new DBConnect();
		ArrayList<ContentVO> list = new ArrayList<ContentVO>();
		try {
			conn = db.dbConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mseq);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ContentVO vo = new ContentVO();
				vo.setCseq(rs.getInt("cseq"));
				vo.setCon(rs.getString("con"));
				vo.setConGubun(rs.getString("con_gubun"));
				vo.setMseq(rs.getInt("mseq"));
				vo.setFilePath(rs.getString("file_path"));
				vo.setFileName(rs.getString("file_name"));
				vo.setRegdate(rs.getString("regdate"));
				vo.setMemberName(rs.getString("name"));
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;
	}
	
	
	//수정하기 

	//삭제하기 
	public int contentDelete(int cseq) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		DBConnect db = new DBConnect();
		String sql = "delete from content where cseq=?";
		int res = 0;
		try {
			conn = db.dbConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cseq);
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
		return res;
	}


}

