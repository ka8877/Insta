package com.kosmo.alone.vo;




public class LikesVO {
	
	private int monPk;
	private int likePk;
	private int likeObject;
	private String likeRegdate;
	private int sseq;
	private int eseq;
	private String monName;
	private int likeCnt;
	private String isMatched;

	public int getLikeCnt() {
		return likeCnt;
	}
	public void setLikeCnt(int likeCnt) {
		this.likeCnt = likeCnt;
	}
	public String getIsMatched() {
		return isMatched;
	}
	public void setIsMatched(String isMatched) {
		this.isMatched = isMatched;
	}
	
	public String getMonName() {
		return monName;
	}
	public void setMonName(String monName) {
		this.monName = monName;
	}
	public int getSseq() {
		return sseq;
	}
	public void setSseq(int sseq) {
		this.sseq = sseq;
	}
	public int getEseq() {
		return eseq;
	}
	public void setEseq(int eseq) {
		this.eseq = eseq;
	}
	public int getMonPk() {
		return monPk;
	}
	public void setMonPk(int monPk) {
		this.monPk = monPk;
	}
	public int getLikePk() {
		return likePk;
	}
	public void setLikePk(int likePk) {
		this.likePk = likePk;
	}
	public int getLikeObject() {
		return likeObject;
	}
	public void setLikeObject(int likeObject) {
		this.likeObject = likeObject;
	}
	public String getLikeRegdate() {
		return likeRegdate;
	}
	public void setLikeRegdate(String likeRegdate) {
		this.likeRegdate = likeRegdate;
	}


}
