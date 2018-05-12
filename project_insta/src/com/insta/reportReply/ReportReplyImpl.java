package com.insta.reportReply;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.insta.db.DBConnect;
import com.insta.member.MemberVO;
import com.insta.reply.ReplyVO;


public class ReportReplyImpl {




	/******************** ReportReplyList()********************/
//resq , reportReply_seq,reportReply_regdate,reportReply_reason
	/**********신고댓글리스트******************&신고댓글***/
	public ArrayList<ReportReplyVO> ReportReplyList() {
		String sql = "select reportReply_seq, rseq, reportReply_regdate, reportReply_reason from report_reply order by reportReply_seq";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBConnect db = new DBConnect();
		ArrayList<ReportReplyVO> list = new ArrayList<ReportReplyVO>();
		try{
			conn=db.dbConn();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ReportReplyVO ivo = new ReportReplyVO();
				ivo.setReportReply_seq(rs.getInt("reportReply_seq"));
				ivo.setRseq(rs.getInt("rseq"));
				ivo.setReportReply_regdate(rs.getString("reportReply_regdate"));
				ivo.setReportReply_reason(rs.getString("reportReply_reason"));				
				list.add(ivo);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;
	}

	
	
	/*******리스트  신고댓글상세보기***댓글&신고댓글*******************/
	public ArrayList<ReplyVO> ReplyReportList() {
	
		String sql = "select rseq, mseq, cseq, reply_Con, replyReg_date, reply_Gubun from reply order by rseq";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBConnect db = new DBConnect();
		ArrayList<ReplyVO> list = new ArrayList<ReplyVO>();			
		try{
			conn=db.dbConn();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ReplyVO ivo = new ReplyVO();
				ivo.setRseq(rs.getInt("rseq"));
				ivo.setMseq(rs.getInt("mseq"));
				ivo.setCseq(rs.getInt("cseq"));
				ivo.setReplyCon(rs.getString("reply_Con"));
				ivo.setReplyRegdate(rs.getString("replyReg_date"));
				
				list.add(ivo);
			
				
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;
	}
	
	//resq , reportReply_seq,reportReply_regdate,reportReply_reason  ,mseq, replyRegdate;
//	select r.rseq, m.mseq, m.replyRegdate ,m.replyCon ,r.reportReply_reason, r.reportReply_regdate  from report_reply r, reply m where r.rseq = m.rseq and mseq=1 ;
	/**********신고댓글리스트******************&신고댓글***/
	public ReportReplyVO JoinReportReplyDetail(int rseq) {
		String sql = "select r.rseq, m.replyReg_date ,m.REPLY_CON ,r.reportReply_reason, r.reportReply_regdate, m.mseq  from report_reply r, reply m where r.rseq = m.rseq and r.rseq=?" ;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBConnect db = new DBConnect();
		ReportReplyVO vo = new ReportReplyVO();
		try{
			conn=db.dbConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rseq);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo.setRseq(rs.getInt("rseq"));
				vo.setReplyRegdate(rs.getString("replyReg_date"));
				
			
				vo.setReplyCon(rs.getString("reply_Con"));				
				vo.setReportReply_reason(rs.getString("reportReply_reason"));		
				vo.setReportReply_regdate(rs.getString("reportReply_regdate"));
				
				vo.setMseq(rs.getInt("mseq"));
					
			
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return vo;
	}
	
	/////////////////////////////////////////////////////////
	
/******* 신고댓글삭제  *********/
public int ReportReplyDelete(int rseq) {
		
		String sql = "delete from report_reply where rseq=?";
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
