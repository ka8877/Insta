package com.insta.reportContent;

public class ReportContentVO {
	
	
		private int reportConSeq; //신고게시물번호
		private int cseq;
		private String reportConRegdate; //신고게시물날짜
		private String reportConReason; //신고게시물이유
		//private String reportConReason;
		
		public int getReportConSeq() {
			return reportConSeq;
		}
		public void setReportConSeq(int reportConSeq) {
			this.reportConSeq = reportConSeq;
		}
		public int getCseq() {
			return cseq;
		}
		public void setCseq(int cseq) {
			this.cseq = cseq;
		}
		public String getReportConRegdate() {
			return reportConRegdate;
		}
		public void setReportConRegdate(String reportConRegdate) {
			this.reportConRegdate = reportConRegdate;
		}
		public String getReportConReason() {
			return reportConReason;
		}
		public void setReportConReason(String reportConReason) {
			this.reportConReason = reportConReason;
		}
			

		
		
		
}
