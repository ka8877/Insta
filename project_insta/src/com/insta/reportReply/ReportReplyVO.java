package com.insta.reportReply;

//resq , reportReply_seq,reportReply_regdate,reportReply_reason  ,mseq, replyRegdate;


public class ReportReplyVO {
	private int rseq ; //댓글번호	
	private int reportReply_seq;  //댓글신고번호
	private String reportReply_regdate;  //신고댓글날짜
	private String reportReply_reason;  //신고댓글이유
	private int  mseq;  //회원번호 
	private String replyRegdate; //댓글쓴날짜
	private String replyCon;  //댓글 
	
	public String getReplyCon() {
		return replyCon;
	}
	public void setReplyCon(String replyCon) {
		this.replyCon = replyCon;
	}
	public int getMseq() {
		return mseq;
	}
	public void setMseq(int mseq) {
		this.mseq = mseq;
	}
	public String getReplyRegdate() {
		return replyRegdate;
	}
	public void setReplyRegdate(String replyRegdate) {
		this.replyRegdate = replyRegdate;
	}
	public int getRseq() {
		return rseq;
	}
	public void setRseq(int rseq) {
		this.rseq = rseq;
	}
	public int getReportReply_seq() {
		return reportReply_seq;
	}
	public void setReportReply_seq(int reportReply_seq) {
		this.reportReply_seq = reportReply_seq;
	}
	public String getReportReply_regdate() {
		return reportReply_regdate;
	}
	public void setReportReply_regdate(String reportReply_regdate) {
		this.reportReply_regdate = reportReply_regdate;
	}
	public String getReportReply_reason() {
		return reportReply_reason;
	}
	public void setReportReply_reason(String reportReply_reason) {
		this.reportReply_reason = reportReply_reason;
	}
	
	

}
