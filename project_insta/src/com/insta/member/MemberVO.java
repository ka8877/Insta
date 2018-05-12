package com.insta.member;

public class MemberVO {

	private int mseq;
	private String email;
	private String name;
	private String userName;
	private String password;
	private String userGubun ;
	private String memberRegdate;
	private String reportMemRegdate;
	
	
	public int getMseq() {
		return mseq;
	}
	public void setMseq(int mseq) {
		this.mseq = mseq;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserGubun() {
		return userGubun;
	}
	public void setUserGubun(String userGubun) {
		this.userGubun = userGubun;
	}
	public String getMemberRegdate() {
		return memberRegdate;
	}
	public void setMemberRegdate(String memberRegdate) {
		this.memberRegdate = memberRegdate;
	}
	public String getReportMemRegdate() {
		return reportMemRegdate;
	}
	public void setReportMemRegdate(String reportMemRegdate) {
		this.reportMemRegdate = reportMemRegdate;
	}
	
	
	
	
	
}
