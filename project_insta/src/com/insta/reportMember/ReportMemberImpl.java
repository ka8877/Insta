package com.insta.reportMember;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.insta.db.DBConnect;
import com.insta.member.MemberVO;

public class ReportMemberImpl {
	/*************신고회원상세보기메서드**********************/
		public ArrayList<MemberVO> DetailMemberList(int mseq) {
		
			String sql ="select m.mseq, m.email, m.user_name,m.name from member m, report_member r where m.mseq = r.mseq";
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			DBConnect db = new DBConnect();
			ArrayList<MemberVO> list = new ArrayList<MemberVO>();			
			try{
				conn=db.dbConn();
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					MemberVO ivo = new MemberVO();
				
					ivo.setMseq(rs.getInt("mseq"));
					ivo.setEmail(rs.getString("email"));
					ivo.setUserName(rs.getString("user_name"));
					ivo.setName(rs.getString("name"));
					list.add(ivo);
				
					
				}
			} catch(SQLException e) {
				e.printStackTrace();
			}finally {
				db.dbClose(rs, pstmt, conn);
			}
			return list;
		}

		
		
	//select mseq, email, user_name, name from member m, report_member r where m.mseq = r.mseq
	/*************신고회원상세보기메서드**********************/
		public ArrayList<JoinVo> JoinMemberList(int mseq) {
		
			String sql ="select m.mseq, m.email, m.user_name, m.name, m.member_regdate, r.reportMemRegdate from member m, report_member r where m.mseq = r.mseq";
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			DBConnect db = new DBConnect();
			ArrayList<JoinVo> list = new ArrayList<JoinVo>();			
			try{
				conn=db.dbConn();
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					JoinVo ivo = new JoinVo();
				
					ivo.setMseq(rs.getInt("mseq"));
					ivo.setEmail(rs.getString("email"));
					ivo.setUser_name(rs.getString("user_name"));
					ivo.setName(rs.getString("name"));
					ivo.setMember_regdate(rs.getString("member_regdate"));
					ivo.setReportMemRegdate(rs.getString("reportMemRegdate"));
					list.add(ivo);
				
					
				}
			} catch(SQLException e) {
				e.printStackTrace();
			}finally {
				db.dbClose(rs, pstmt, conn);
			}
			return list;
		}
		
		
		/*************신고회원 보기메서드**********************/
		//reportMemSeq, mseq,reportMemRegdate, reportMemReason
		public ArrayList<ReportMemberVO> ReportmemberList() {
			String sql = "select r.reportMemSeq, r.mseq, r.reportMemRegdate, r.reportMemReason, m.user_gubun  from report_member r inner join member m on r.mseq=m.mseq order by r.reportMemSeq";
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			DBConnect db = new DBConnect();
			ArrayList<ReportMemberVO> list = new ArrayList<ReportMemberVO>();
			try{
				conn=db.dbConn();
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					ReportMemberVO ivo = new ReportMemberVO();
					ivo.setReportMemSeq(rs.getInt("reportMemSeq"));
					ivo.setMseq(rs.getInt("mseq"));
					ivo.setReportMemRegdate(rs.getString("reportMemRegdate"));
					ivo.setReportMemReason(rs.getString("reportMemReason"));
					ivo.setUserGubun(rs.getString("user_gubun"));
					list.add(ivo);
				}
			} catch(SQLException e) {
				e.printStackTrace();
			}finally {
				db.dbClose(rs, pstmt, conn);
			}
			return list;
		}
	
public int ReportmemberDelete(int mseq) {
		
		String sql = "delete from report_member where mseq=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		DBConnect db = new DBConnect();
		ResultSet rs = null;
		int res = 0;
		try{
			conn = db.dbConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mseq);
			res = pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return res;
	}
	  
//update member set user_gubun='v'  where mseq=11;
public int ReportmemberUpdate(int mseq) {
	String sql = "update member set user_gubun='v'  where mseq=?";
	Connection conn = null;
	PreparedStatement pstmt = null;
	DBConnect db = new DBConnect();
	ResultSet rs = null;
	int res = 0;
	try{
		conn = db.dbConn();
		pstmt = conn.prepareStatement(sql);		
	    pstmt.setInt(1, mseq);

	    res = pstmt.executeUpdate();
	} catch(SQLException e) {
		e.printStackTrace();
	}finally {
		db.dbClose(rs, pstmt, conn);
	}
	return res;
}
public int OnReportmemberUpdate(int mseq) {
	String sql = "update member set user_gubun='u'where mseq=?";
	Connection conn = null;
	PreparedStatement pstmt = null;
	DBConnect db = new DBConnect();
	ResultSet rs = null;
	int res = 0;
	try{
		conn = db.dbConn();
		pstmt = conn.prepareStatement(sql);		
	    pstmt.setInt(1, mseq);

	    res = pstmt.executeUpdate();
	} catch(SQLException e) {
		e.printStackTrace();
	}finally {
		db.dbClose(rs, pstmt, conn);
	}
	return res;
}

	
	  
}


	
	  

