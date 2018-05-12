package com.kosmo.alone.vo;

public class LikesVO {
	
	private int monPk;
	private int likePk;
	private int likeObject;
	private String likeRegdate;
	private int likeCnt;
	private String isMatched;

	public String getIsMatched() {
		return isMatched;
	}
	public void setIsMatched(String isMatched) {
		this.isMatched = isMatched;
	}
	public int getLikeCnt() {
		return likeCnt;
	}
	public void setLikeCnt(int likeCnt) {
		this.likeCnt = likeCnt;
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
