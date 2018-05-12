package com.insta.content;

import java.util.ArrayList;

import com.insta.reply.ReplyVO;

public class ContentVO {

	private int cseq;
	private String con;
	private String conGubun;
	private int mseq;
	private String filePath;
	private String fileName;
	private String regdate;
	private String hashtagList;
	private String memberName;
	private String location;
	
	private ArrayList<ReplyVO> rlist;
	
	
	
	public ArrayList<ReplyVO> getRlist() {
		return rlist;
	}
	public void setRlist(ArrayList<ReplyVO> rlist) {
		this.rlist = rlist;
	}
	
	
	public int getCseq() {
		return cseq;
	}
	public void setCseq(int cseq) {
		this.cseq = cseq;
	}

	public String getCon() {
		return con;
	}
	public void setCon(String con) {
		this.con = con;
	}
	public String getConGubun() {
		return conGubun;
	}
	public void setConGubun(String conGubun) {
		this.conGubun = conGubun;
	}
	public int getMseq() {
		return mseq;
	}
	public void setMseq(int mseq) {
		this.mseq = mseq;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getHashtagList() {
		return hashtagList;
	}
	public void setHashtagList(String hashtagList) {
		this.hashtagList = hashtagList;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	
	
}
