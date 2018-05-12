package com.insta.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.insta.db.DBConnect;


public class MemberImpl{

	public ArrayList<MemberVO> memberList() {
		String sql = "select mseq,email,user_name,name,user_gubun,member_regdate from member order by mseq";
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
				ivo.setName(rs.getString("name"));
				ivo.setUserName(rs.getString("user_name"));
				ivo.setUserGubun(rs.getString("user_gubun"));
				ivo.setMemberRegdate(rs.getString("member_regdate"));
				list.add(ivo);
			}					
		} catch(SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;	
	}

	public int memberDelete(int mseq) {

		String sql = "delete from member where mseq=?";
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



	public MemberVO login(MemberVO vo) {
		MemberVO rvo = new MemberVO();;
		String sql = "select user_name, name, mseq, user_gubun, password from member where email=? and password=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBConnect db = new DBConnect();
		try{
			conn = db.dbConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getEmail());
			pstmt.setString(2, vo.getPassword());
			rs = pstmt.executeQuery();
			if(rs.next()) {					
				rvo.setUserName(rs.getString("user_name")); 
				rvo.setName(rs.getString("name"));   
				rvo.setUserGubun(rs.getString("user_gubun"));
				rvo.setMseq(rs.getInt("mseq"));  
				rvo.setPassword(rs.getString("password"));
			}

		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return rvo;
	}


	public int memberInsert(MemberVO vo) {
		String sql = "insert into member(mseq,email,name,user_name,password,user_gubun) values(member_seq.nextval,?,?,?,?,'u')";
		String sql2 = "select mseq from member";
				
		Connection conn = null;
		Connection conn2 = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		DBConnect db = new DBConnect();
		DBConnect db2 = new DBConnect();
		ResultSet rs = null;
		ResultSet rs2 = null;
		int res = 0;
		try{
			conn = db.dbConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getEmail());
			pstmt.setString(2, vo.getName());
			pstmt.setString(3, vo.getUserName());
			pstmt.setString(4, vo.getPassword());
			res = pstmt.executeUpdate();
		
			conn2 = db2.dbConn();
			pstmt2= conn2.prepareStatement(sql2);
			rs2 = pstmt2.executeQuery();
			
			while(rs2.next()){			
			res = rs2.getInt("mseq");
			}
			
		} catch(SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}

		return res;
	}
	
	public int profileInsert(int res) {
		String sql = "insert into profile(mseq,open_gubun) values(?,'u')";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		DBConnect db = new DBConnect();
		ResultSet rs = null;
		try{
			conn = db.dbConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, res);
			res = pstmt.executeUpdate();
			
		} catch(SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}

		return 0;
		
	}
	



	public int memberUpdate(MemberVO vo) {
		String sql = "update member set user_name=? , password=? where mseq=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		DBConnect db = new DBConnect();
		ResultSet rs = null;
		int res = 0;
		try{
			conn = db.dbConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getUserName());
			pstmt.setString(2, vo.getPassword());
			pstmt.setInt(3, vo.getMseq());
			res = pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return res;
	}


	public MemberVO memberDetail(int mseq){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBConnect db = new DBConnect();
		
	String sql ="select m.mseq, m.email, m.user_name, m.name, m.member_regdate, r.reportMemRegdate from member m, report_member r where m.mseq = r.mseq and m.mseq=?";
		
		MemberVO vo = new MemberVO();
		try {
			conn = db.dbConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,mseq);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.setMseq(rs.getInt("mseq"));
				vo.setEmail(rs.getString("email"));
				vo.setUserName(rs.getString("user_name"));
				vo.setName(rs.getString("name"));
				vo.setMemberRegdate(rs.getString("member_regdate"));
				vo.setReportMemRegdate(rs.getString("reportMemRegdate"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return vo;
		
	}
	
	
	public int passwordUpdate(MemberVO vo) {
		String sql = "update member set password=? where mseq=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		DBConnect db = new DBConnect();
		ResultSet rs = null;
		int res = 0;
		try{
			conn = db.dbConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getPassword());
			pstmt.setInt(2, vo.getMseq());
			res = pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return res;
	}

	
	public MemberVO memberDetail2(int mseq) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBConnect db = new DBConnect();
		String sql = "select name,user_name,email from member where mseq=?";
		MemberVO vo = new MemberVO();
		try {
			conn = db.dbConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mseq);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.setName(rs.getString("name"));
				vo.setUserName(rs.getString("user_name"));
				vo.setEmail(rs.getString("email"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return vo;
	}

	
	public MemberVO passwordDetail(int mseq) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBConnect db = new DBConnect();
		String sql = "select password from member where mseq=?";
		MemberVO vo = new MemberVO();
		try {
			conn = db.dbConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mseq);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.setPassword(rs.getString("password"));
				
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return vo;
	}	



}




