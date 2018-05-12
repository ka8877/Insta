package com.insta.profile;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.insta.content.ContentVO;
import com.insta.db.DBConnect;
import com.insta.member.MemberVO;

public class ProfileImpl {
	public ProfileVO profileDetail(int mseq) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBConnect db = new DBConnect();
		String sql = "select website,intro,gender from profile where mseq=?";
		ProfileVO vo = new ProfileVO();
		try {
			conn = db.dbConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mseq);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.setWebsite(rs.getString("website"));
				vo.setIntro(rs.getString("intro"));
				vo.setGender(rs.getString("gender"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return vo;
	}
	
	public int profileUpdate(MemberVO vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		DBConnect db = new DBConnect();
	
		String sql = "update member set name=?,user_name=?,email=? where mseq=?";
		int res = 0;
		try {
			conn = db.dbConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getUserName());
			pstmt.setString(3, vo.getEmail());
			pstmt.setInt(4, vo.getMseq());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
//			System.out.println(vo.getName()+"뭐가들어왔나 확인합니다. 프로필impl");
		}
		return res;
		
	}
  
	public int profileUpdate2(ProfileVO vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		DBConnect db = new DBConnect();
		
		
		String sql = "update profile set website=?,intro=?,gender=? where mseq=?";
		int res = 0;
		try {
			conn = db.dbConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getWebsite());
			pstmt.setString(2, vo.getIntro());
			pstmt.setString(3, vo.getGender());
			pstmt.setInt(4, vo.getMseq());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
		return res;
	}
		
	public int pictureUpdate(ProfileVO vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int res = 0;
		DBConnect db = new DBConnect();
		String sql = "update profile set my_picture_name=?,my_picture_path=? where mseq=?";
		try {
			conn = db.dbConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMyPictureName());
			pstmt.setString(2, vo.getMyPicturePath());
			pstmt.setInt(3, vo.getMseq());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
		return res;
	}
	public int pictureDelete(ProfileVO vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int res = 0;
		DBConnect db = new DBConnect();
		String sql = "update profile set my_picture_name='',my_picture_path='' where mseq=?";
		try {
			conn = db.dbConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getMseq());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
		return res;
	}
	public ProfileVO myPictureDetail(int mseq) {
		String sql = "select my_picture_name,my_picture_path from profile where mseq=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBConnect db = new DBConnect();
		ProfileVO vo = new ProfileVO();
		try {
			conn = db.dbConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mseq);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo.setMyPicturePath(rs.getString("my_picture_path"));
				vo.setMyPictureName(rs.getString("my_picture_name"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return vo;
	}
		
		
}	
