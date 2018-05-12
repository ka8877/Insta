package com.insta.follower;

public class FollowerVO {

	private int followerSeq;
	private int requesterSeq;
	private String regdate;
	private String memberName;
	private String myPictureName;
	
	public int getFollowerSeq() {
		return followerSeq;
	}
	public void setFollowerSeq(int followerSeq) {
		this.followerSeq = followerSeq;
	}
	public int getRequesterSeq() {
		return requesterSeq;
	}
	public void setRequesterSeq(int requesterSeq) {
		this.requesterSeq = requesterSeq;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMyPictureName() {
		return myPictureName;
	}
	public void setMyPictureName(String myPictureName) {
		this.myPictureName = myPictureName;
	}
	
	
}
