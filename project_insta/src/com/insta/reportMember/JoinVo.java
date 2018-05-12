package com.insta.reportMember;
//mseq, reportmemseq, user_name, name, reportmemregdate;
public class JoinVo {

	private int mseq;
	private String email;
	private String user_name;
	private String name; 
	private String member_regdate;
	private String reportMemRegdate;
	//select mseq, email, user_name, name, ,member_regdate,reportMemRegdate;
	//select mseq, email, user_name, name, member_regdate, reportMemRegdate from member m, report_member r where m.mseq = r.mseq
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
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMember_regdate() {
		return member_regdate;
	}
	public void setMember_regdate(String member_regdate) {
		this.member_regdate = member_regdate;
	}
	public String getReportMemRegdate() {
		return reportMemRegdate;
	}
	public void setReportMemRegdate(String reportMemRegdate) {
		this.reportMemRegdate = reportMemRegdate;
	}
	
	
	
	
	
	
}
