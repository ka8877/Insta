package com.insta.reportContent;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.insta.db.DBConnect;

public class ReportContentImpl {
	
	
	//select REPORTCONSEQ ,CSEQ ,REPORTCONREASON, REPORTCONREGDATE   from report_content order by REPORTCONSEQ

	public ArrayList<ReportContentVO> conList() {
		String sql = "select REPORTCONSEQ ,CSEQ ,REPORTCONREASON, REPORTCONREGDATE   from report_content order by CSEQ";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBConnect db = new DBConnect();
		ArrayList<ReportContentVO> list = new ArrayList<ReportContentVO>();
		try{
			conn=db.dbConn();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ReportContentVO ivo = new ReportContentVO();
				ivo.setReportConSeq(rs.getInt("reportConSeq"));
				ivo.setCseq(rs.getInt("cseq"));
				ivo.setReportConReason(rs.getString("reportConReason"));
				ivo.setReportConRegdate(rs.getString("reportConRegdate"));
	
				list.add(ivo);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;
	}
	
	
	
	/////////////////////////////////////////////////////////
	
	
public int reportConDelete(int cseq) {
		
		String sql = "delete from report_content where cseq=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		DBConnect db = new DBConnect();
		ResultSet rs = null;
		int res = 0;
		try{
			conn = db.dbConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cseq);
			res = pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return res;
	}
	
	
	
	
	
	
	
	

}
