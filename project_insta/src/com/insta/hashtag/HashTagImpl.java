package com.insta.hashtag;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.insta.content.ContentVO;
import com.insta.db.DBConnect;
import com.insta.follower.FollowerVO;
import com.insta.member.MemberVO;
import com.insta.reply.ReplyVO;

public class HashTagImpl implements HashTag{

	@Override
	public ArrayList<MemberVO> memberList() {
		String sql = "select mseq,email,name,user_name,password,user_gubun from member";
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
				MemberVO vo = new MemberVO();
				vo.setMseq(rs.getInt("mseq"));
				vo.setEmail(rs.getString("email"));
				vo.setName(rs.getString("name"));
				vo.setUserName(rs.getString("user_name"));
				vo.setPassword(rs.getString("password"));
				vo.setUserGubun(rs.getString("user_gubun"));
				list.add(vo);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;
	}
	
	public ArrayList<MemberVO> memberList(Connection conn) {
		String sql = "select mseq,email,name,user_name,password,user_gubun from member";
//		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBConnect db = new DBConnect();
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		try{
//			conn=db.dbConn();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MemberVO vo = new MemberVO();
				vo.setMseq(rs.getInt("mseq"));
				vo.setEmail(rs.getString("email"));
				vo.setName(rs.getString("name"));
				vo.setUserName(rs.getString("user_name"));
				vo.setPassword(rs.getString("password"));
				vo.setUserGubun(rs.getString("user_gubun"));
				list.add(vo);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt);
		}
		return list;
	}
	
	@Override
	public MemberVO memberDetail(int mseq) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBConnect db = new DBConnect();
		String sql = "select mseq, email, name, user_name, password, user_gubun from member where mseq=?";
		MemberVO vo = new MemberVO();
		try {
			conn = db.dbConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mseq);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.setMseq(rs.getInt("mseq"));
				vo.setEmail(rs.getString("email"));
				vo.setName(rs.getString("name"));
				vo.setUserName(rs.getString("user_name"));
				vo.setPassword(rs.getString("password"));
				vo.setUserGubun(rs.getString("user_gubun"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return vo;
	}
	
	@Override
	public MemberVO memberDetail(String name) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBConnect db = new DBConnect();
		String sql = "select mseq, email, name, user_name, password, user_gubun from member where name=?";
		MemberVO vo = new MemberVO();
		try {
			conn = db.dbConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.setMseq(rs.getInt("mseq"));
				vo.setEmail(rs.getString("email"));
				vo.setName(rs.getString("name"));
				vo.setUserName(rs.getString("user_name"));
				vo.setPassword(rs.getString("password"));
				vo.setUserGubun(rs.getString("user_gubun"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return vo;
	}

	
	@Override
	public int contentInsert(ContentVO vo) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		int res = 0;
		DBConnect db = new DBConnect();
		String sql = "insert into content(cseq, con, con_gubun, mseq, file_path, file_name, regdate, hashtag_list, location) values(content_seq.nextval, ?, 'n', ?, ?, ?, sysdate, ?, ?)";
		try {
			conn = db.dbConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getCon());
			pstmt.setInt(2, vo.getMseq());
			pstmt.setString(3, vo.getFilePath());
			pstmt.setString(4, vo.getFileName());
			pstmt.setString(5, vo.getHashtagList());
			pstmt.setString(6, vo.getLocation());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
		return res;
		
	}
	
	@Override 
	public ArrayList<ContentVO> contentList() {
		String sql = "select cseq,con,con_gubun,mseq,file_path,file_name,regdate, hashtag_list, location from content order by regdate desc";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBConnect db = new DBConnect();
		ArrayList<ContentVO> list = new ArrayList<ContentVO>();
		try {
			conn = db.dbConn();
			pstmt = conn.prepareStatement(sql);
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
				vo.setHashtagList(rs.getString("hashtag_list"));
				vo.setLocation(rs.getString("location"));
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;
	}

	@Override 
	public ContentVO contentDetail(int cseq) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBConnect db = new DBConnect();
		String sql = "select c.cseq, c.con, c.con_gubun, c.mseq, c.file_path, c.file_name, c.regdate, c.hashtag_list, c.location, m.name from content c, member m where c.mseq=m.mseq and c.cseq=?";
		ContentVO vo = new ContentVO();
		try {
			conn = db.dbConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cseq);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.setCseq(rs.getInt("cseq"));
				vo.setCon(rs.getString("con"));
				vo.setConGubun(rs.getString("con_gubun"));
				vo.setMseq(rs.getInt("mseq"));
				vo.setFilePath(rs.getString("file_path"));
				vo.setFileName(rs.getString("file_name"));
				vo.setRegdate(rs.getString("regdate"));
				vo.setHashtagList(rs.getString("hashtag_list"));
				vo.setLocation(rs.getString("location"));
				vo.setMemberName(rs.getString("name"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return vo;
	}
	
	
	@Override
	public ArrayList<ContentVO> selectMemberSeqList(int mseq) {
		String sql = "select c.cseq, c.con, c.con_gubun, m.mseq, c.file_path, c.file_name, c.regdate, m.name, c.hashtag_list, c.location  from content c, member m where c.mseq = m.mseq and m.mseq=? ORDER by regdate desc";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBConnect db = new DBConnect();
		ArrayList<ContentVO> list = new ArrayList<ContentVO>();
		try{
			conn=db.dbConn();
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
				vo.setHashtagList(rs.getString("hashtag_list"));
				vo.setLocation(rs.getString("location"));
				list.add(vo);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;
	}


	
	public ArrayList<ContentVO> selectMemberSeqList(int mseq, Connection conn) {
		String sql = "select c.cseq, c.con, c.con_gubun, m.mseq, c.file_path, c.file_name, c.regdate, m.name, c.hashtag_list, c.location  from content c, member m where c.mseq = m.mseq and m.mseq=? ORDER by regdate desc";
		//Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBConnect db = new DBConnect();
		ArrayList<ContentVO> list = new ArrayList<ContentVO>();
		try{
			//conn=db.dbConn();
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
				vo.setHashtagList(rs.getString("hashtag_list"));
				vo.setLocation(rs.getString("location"));
				list.add(vo);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt);
		}
		return list;
	}
	
	
	@Override
	public ArrayList<ContentVO> selectContentName(String memberName) {
		String sql = "select c.cseq, c.con, c.con_gubun, m.mseq, c.file_path, c.file_name, c.regdate, m.name from content c, member m where c.mseq = m.mseq and m.name=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBConnect db = new DBConnect();
		ArrayList<ContentVO> list = new ArrayList<ContentVO>();
		try{
			conn=db.dbConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberName);
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
		} catch(SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;
	}
	
	@Override
	public int selectContentNameCount(String memberName) { 
		Connection conn = null; 
		PreparedStatement pstmt = null; 
		ResultSet rs = null; 
		DBConnect db = new DBConnect(); 
		int cnt = 0; 
		String sql = "select count(*) cnt from content c, member m where c.mseq = m.mseq and m.name=?"; 
		try { 
			conn = db.dbConn(); 
			pstmt = conn.prepareStatement(sql); 
			pstmt.setString(1, memberName);
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
	
	
	@Override
	public ArrayList<ReplyVO> replyList(int cseq) {
		String sql = "select r.rseq, r.mseq, r.cseq, r.reply_con, r.reply_gubun, r.replyReg_date, m.name from reply r, member m where r.mseq=m.mseq and r.cseq=? order by r.replyReg_date";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBConnect db = new DBConnect();
		ArrayList<ReplyVO> list = new ArrayList<ReplyVO>();
		try{
			conn=db.dbConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cseq);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ReplyVO vo = new ReplyVO();
				vo.setRseq(rs.getInt("rseq"));
				vo.setMseq(rs.getInt("mseq"));
				vo.setCseq(rs.getInt("cseq"));
				vo.setReplyCon(rs.getString("reply_con"));
				vo.setReplyGubun(rs.getString("reply_gubun"));
				vo.setReplyRegdate(rs.getString("replyReg_date"));
				vo.setMemberName(rs.getString("name"));
				list.add(vo);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;
	}

	
	public ArrayList<ReplyVO> replyList(int cseq, Connection conn) {
		String sql = "select r.rseq, r.mseq, r.cseq, r.reply_con, r.reply_gubun, r.replyReg_date, m.name from reply r, member m where r.mseq=m.mseq and r.cseq=? order by r.replyReg_date";
		//Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBConnect db = new DBConnect();
		ArrayList<ReplyVO> list = new ArrayList<ReplyVO>();
		try{
			//conn=db.dbConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cseq);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ReplyVO vo = new ReplyVO();
				vo.setRseq(rs.getInt("rseq"));
				vo.setMseq(rs.getInt("mseq"));
				vo.setCseq(rs.getInt("cseq"));
				vo.setReplyCon(rs.getString("reply_con"));
				vo.setReplyGubun(rs.getString("reply_gubun"));
				vo.setReplyRegdate(rs.getString("replyReg_date"));
				vo.setMemberName(rs.getString("name"));
				list.add(vo);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt);
		}
		return list;
	}
	
	@Override
	public int replyInsert(ReplyVO vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int res = 0;
		DBConnect db = new DBConnect();
		String sql = "insert into reply(rseq, mseq, cseq, reply_con, reply_gubun, replyreg_date) values(reply_seq.nextval, ?, ?, ?, 'n', sysdate)";
		try {
			conn = db.dbConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getMseq());
			pstmt.setInt(2, vo.getCseq());
			pstmt.setString(3, vo.getReplyCon());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
		return res;
	}

	@Override
	public int replyDelete(int rseq) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		DBConnect db = new DBConnect();
		String sql = "delete from reply where rseq=?";
		int res = 0;
		try {
			conn = db.dbConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rseq);
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
		return res;
	}
	

	@Override
	public ArrayList<ContentVO> selectHashTagName(String hashTag) { 		//만들어야됨
		String sql = "select c.cseq, c.con, c.con_gubun, m.mseq, c.file_path, c.file_name, c.regdate, m.name from content c, member m where c.mseq = m.mseq and c.hashtag_List like ?";                 
		Connection conn = null;							
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBConnect db = new DBConnect();
		ArrayList<ContentVO> list = new ArrayList<ContentVO>();
		try{
			conn=db.dbConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,"%"+ hashTag+"%");
			
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
		} catch(SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;
	}
	
	
	@Override
	public int hashtagInsert(HashTagVO vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int res = 0;
		DBConnect db = new DBConnect();
		String sql = "insert into hashtag(hashtag_id, hashtag_name) values(hashtag_seq.nextval, ?)";
		try {
			conn = db.dbConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getHashtagName());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
		return res;
	}
	
	@Override
	public int selectContentHashtagCount(String hashTag) {
		Connection conn = null; 
		PreparedStatement pstmt = null; 
		ResultSet rs = null; 
		DBConnect db = new DBConnect(); 
		int cnt = 0; 
		String sql = "select count(*) cnt from content c, member m where c.mseq = m.mseq and c.hashtag_List like ?"; 
		try { 
			conn = db.dbConn(); 
			pstmt = conn.prepareStatement(sql); 
			pstmt.setString(1, "%"+hashTag+"%");
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
	
	
	@Override
	public ArrayList<FollowerVO> followerList(int followerSeq) {
		String sql = "select follower_Seq, requester_Seq, regdate from follower where follower_seq=?";                 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBConnect db = new DBConnect();
		ArrayList<FollowerVO> list = new ArrayList<FollowerVO>();
		try{
			conn=db.dbConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, followerSeq);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				FollowerVO vo = new FollowerVO();
				vo.setFollowerSeq(rs.getInt("follower_Seq"));
				vo.setRequesterSeq(rs.getInt("requester_Seq"));
				vo.setRegdate(rs.getString("regdate"));
				list.add(vo);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;
	}
	
	
	

	
	public ArrayList<FollowerVO> followerList(int followerSeq, Connection conn) {
		String sql = "select follower_Seq, requester_Seq, regdate from follower where follower_seq=?";                 
		//Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBConnect db = new DBConnect();
		ArrayList<FollowerVO> list = new ArrayList<FollowerVO>();
		try{
			//conn=db.dbConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, followerSeq);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				FollowerVO vo = new FollowerVO();
				vo.setFollowerSeq(rs.getInt("follower_Seq"));
				vo.setRequesterSeq(rs.getInt("requester_Seq"));
				vo.setRegdate(rs.getString("regdate"));
				list.add(vo);
			}
		} catch(SQLException e) {
			e.printStackTrace();
			db.dbClose(rs, pstmt);
		}finally {
		}
		return list;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	@Override
	public ArrayList<FollowerVO> requesterList(int requesterSeq) {
		String sql = "select follower_Seq, requester_Seq, regdate from follower where REQUESTER_SEQ=?";                 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBConnect db = new DBConnect();
		ArrayList<FollowerVO> list = new ArrayList<FollowerVO>();
		try{
			conn=db.dbConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, requesterSeq);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				FollowerVO vo = new FollowerVO();
				vo.setFollowerSeq(rs.getInt("follower_Seq"));
				vo.setRequesterSeq(rs.getInt("requester_Seq"));
				vo.setRegdate(rs.getString("regdate"));
				list.add(vo);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;
	}


	
	public ArrayList<FollowerVO> requesterList(int requesterSeq, Connection conn) {
		String sql = "select follower_Seq, requester_Seq, regdate from follower where REQUESTER_SEQ=?";                 
		//Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBConnect db = new DBConnect();
		ArrayList<FollowerVO> list = new ArrayList<FollowerVO>();
		try{
			//conn=db.dbConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, requesterSeq);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				FollowerVO vo = new FollowerVO();
				vo.setFollowerSeq(rs.getInt("follower_Seq"));
				vo.setRequesterSeq(rs.getInt("requester_Seq"));
				vo.setRegdate(rs.getString("regdate"));
				list.add(vo);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt);
		}
		return list;
	}
	
	
	@Override
	public ArrayList<ContentVO> contentReplyList() {
		String sql = "select cseq,con,con_gubun,mseq,file_path,file_name,regdate, hashtag_list, location from content order by cseq";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBConnect db = new DBConnect();
		ArrayList<ContentVO> list = new ArrayList<ContentVO>();
		try {
			conn = db.dbConn();
			pstmt = conn.prepareStatement(sql);
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
				vo.setHashtagList(rs.getString("hashtag_list"));
				vo.setLocation(rs.getString("location"));
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;
	}

	@Override
	public int followInsert(int followerSeq, int requesterSeq) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int res = 0;
		DBConnect db = new DBConnect();
		String sql = "insert into follower(FOLLOWER_SEQ, REQUESTER_SEQ) values(?, ?)";
		try {
			conn = db.dbConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, followerSeq);
			pstmt.setInt(2, requesterSeq);
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
		return res;
	}

	@Override
	public int followdelete(int followerSeq, int requesterSeq) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		DBConnect db = new DBConnect();
		String sql = "delete from follower where FOLLOWER_SEQ=? and REQUESTER_SEQ=?";
		int res = 0;
		try {
			conn = db.dbConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, followerSeq);
			pstmt.setInt(2, requesterSeq);
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
		return res;
	}

	@Override
	public int followerCount(int followerSeq) {
		Connection conn = null; 
		PreparedStatement pstmt = null; 
		ResultSet rs = null; 
		DBConnect db = new DBConnect(); 
		int cnt = 0; 
		String sql = "select count(*) cnt from follower where follower_seq=?"; 
		try { 
			conn = db.dbConn(); 
			pstmt = conn.prepareStatement(sql); 
			pstmt.setInt(1, followerSeq);
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

	@Override
	public int requesterCount(int requesterSeq) {
		Connection conn = null; 
		PreparedStatement pstmt = null; 
		ResultSet rs = null; 
		DBConnect db = new DBConnect(); 
		int cnt = 0; 
		String sql = "select count(*) cnt from follower where requester_seq=?"; 
		try { 
			conn = db.dbConn(); 
			pstmt = conn.prepareStatement(sql); 
			pstmt.setInt(1, requesterSeq);
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

	@Override
	public ArrayList<FollowerVO> myFollowerList(int mseq) {
		String sql = "select f.follower_Seq, f.requester_Seq, f.regdate, m.name, p.MY_PICTURE_NAME from follower f, member m, profile p where f.requester_seq = m.MSEQ(+) and m.mseq=p.mseq(+) and f.follower_Seq=?";                 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBConnect db = new DBConnect();
		ArrayList<FollowerVO> list = new ArrayList<FollowerVO>();
		try{
			conn=db.dbConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mseq);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				FollowerVO vo = new FollowerVO();
				vo.setFollowerSeq(rs.getInt("follower_Seq"));
				vo.setRequesterSeq(rs.getInt("requester_Seq"));
				vo.setRegdate(rs.getString("regdate"));
				vo.setMemberName(rs.getString("name"));
				vo.setMyPictureName(rs.getString("my_Picture_Name"));
				list.add(vo);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;
	}


	@Override
	public ArrayList<FollowerVO> myRequesterList(int mseq) {
		String sql = "select f.follower_Seq, f.requester_Seq, f.regdate, m.name, p.MY_PICTURE_NAME from follower f, member m, profile p where f.follower_Seq = m.MSEQ(+) and m.mseq=p.mseq(+) and f.requester_seq=?";                 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBConnect db = new DBConnect();
		ArrayList<FollowerVO> list = new ArrayList<FollowerVO>();
		try{
			conn=db.dbConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mseq);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				FollowerVO vo = new FollowerVO();
				vo.setFollowerSeq(rs.getInt("follower_Seq"));
				vo.setRequesterSeq(rs.getInt("requester_Seq"));
				vo.setRegdate(rs.getString("regdate"));
				vo.setMemberName(rs.getString("name"));
				vo.setMyPictureName(rs.getString("my_Picture_Name"));
				list.add(vo);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;
	} 
	

	
}
