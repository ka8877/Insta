package com.insta.message;

public class MessageVO {

	private int messSeq;
	private int receiver_seq;
	private int mseq;
	private int messTitle;
	private int messCon;
	private int sendDate;
	private int readDate;
	
	public int getMessSeq() {
		return messSeq;
	}
	public void setMessSeq(int messSeq) {
		this.messSeq = messSeq;
	}
	public int getReceiver_seq() {
		return receiver_seq;
	}
	public void setReceiver_seq(int receiver_seq) {
		this.receiver_seq = receiver_seq;
	}
	public int getMseq() {
		return mseq;
	}
	public void setMseq(int mseq) {
		this.mseq = mseq;
	}
	public int getMessTitle() {
		return messTitle;
	}
	public void setMessTitle(int messTitle) {
		this.messTitle = messTitle;
	}
	public int getMessCon() {
		return messCon;
	}
	public void setMessCon(int messCon) {
		this.messCon = messCon;
	}
	public int getSendDate() {
		return sendDate;
	}
	public void setSendDate(int sendDate) {
		this.sendDate = sendDate;
	}
	public int getReadDate() {
		return readDate;
	}
	public void setReadDate(int readDate) {
		this.readDate = readDate;
	}
}
