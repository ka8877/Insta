package com.insta.reply;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.insta.db.DBConnect;
import com.insta.reportReply.ReportReplyVO;

public class ReplyImpl {
	
	
	/****댓글테이블 댓글관련리스트****************&신고댓글***/
	public ReplyVO ReplyDetailList(int rseq) { 
		String sql = "select rseq,mseq,cseq,replyCon,replyRegdate,replyGubun from  reply  where  rseq=?  order by rseq" ;
		//rseq,mseq,cseq,replyCon,replyRegdate,replyGubun
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBConnect db = new DBConnect();
		ReplyVO vo = new ReplyVO();
		try{
			conn=db.dbConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rseq);
			rs = pstmt.executeQuery();			
			while(rs.next()) {
				vo.setRseq(rs.getInt("rseq"));
				vo.setMseq(rs.getInt("mseq"));
				vo.setCseq(rs.getInt("cseq"));
				vo.setReplyCon(rs.getString("replyCon"));	
				vo.setReplyRegdate(rs.getString("replyRegdate"));
				vo.setReplyGubun(rs.getString("replyGubun"));  //댓글신고여부 n / v 
			
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return vo;
	}
	
	
//////////////(신고게시물 & 신고댓글) ReplyList
	public ArrayList<ReplyVO> ReplyList(int rseq) {  
		String sql = "select rseq, mseq,cseq, replyCon,replyRegdate, replyGubun from reply where rseq=? order by rseq";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBConnect db = new DBConnect();
		ArrayList<ReplyVO> list = new ArrayList<ReplyVO>();
		try{
			conn=db.dbConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rseq);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ReplyVO ivo = new ReplyVO();
				ivo.setRseq(rs.getInt("rseq"));
				ivo.setMseq(rs.getInt("mseq"));
				ivo.setCseq(rs.getInt("cseq"));
				ivo.setReplyCon(rs.getString("replyCon"));
				ivo.setReplyRegdate(rs.getString("replyRegdate"));
				ivo.setReplyGubun(rs.getString("replyGubun"));  //댓글신고여부 n / v 
				list.add(ivo);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;
	}
	
	
	//rseq, mseq,cseq, replyCon,replyRegdate, replyGubun
	/////////////////////////////////////////////////////////
/*********  댓글삭제    **********/	
public int ReplyDelete(int rseq) {	
		String sql = "delete from reply where rseq=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		DBConnect db = new DBConnect();
		ResultSet rs = null;
		int res = 0;
		try{
			conn = db.dbConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rseq);
			res = pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return res;
	}
	
	
	
	
	
}
