package com.kosmo.alone.vo;

public class HotReviewsVO {
	
	private int hotPk;
	private int monPk;
	private int hotCateSeq;
	private int hotRevPk;
	private String hotRevCon;
	private int hotRevServiceRating;
	private String hotRevRegdate;
	private int hotCostRating;
	
	//mon_name , monProfile추가
	private String MonName;
	private String monProfile;

	
	public int getHotPk() {
		return hotPk;
	}
	public void setHotPk(int hotPk) {
		this.hotPk = hotPk;
	}
	public int getMonPk() {
		return monPk;
	}
	public void setMonPk(int monPk) {
		this.monPk = monPk;
	}
	public int getHotCateSeq() {
		return hotCateSeq;
	}
	public void setHotCateSeq(int hotCateSeq) {
		this.hotCateSeq = hotCateSeq;
	}
	public int getHotRevPk() {
		return hotRevPk;
	}
	public void setHotRevPk(int hotRevPk) {
		this.hotRevPk = hotRevPk;
	}
	public String getHotRevCon() {
		return hotRevCon;
	}
	public void setHotRevCon(String hotRevCon) {
		this.hotRevCon = hotRevCon;
	}
	public int getHotRevServiceRating() {
		return hotRevServiceRating;
	}
	public void setHotRevServiceRating(int hotRevServiceRating) {
		this.hotRevServiceRating = hotRevServiceRating;
	}
	public String getHotRevRegdate() {
		return hotRevRegdate;
	}
	public void setHotRevRegdate(String hotRevRegdate) {
		this.hotRevRegdate = hotRevRegdate;
	}
	public int getHotCostRating() {
		return hotCostRating;
	}
	public void setHotCostRating(int hotCostRating) {
		this.hotCostRating = hotCostRating;
	}
	public String getMonName() {
		return MonName;
	}
	public void setMonName(String monName) {
		MonName = monName;
	}
	public String getMonProfile() {
		return monProfile;
	}
	public void setMonProfile(String monProfile) {
		this.monProfile = monProfile;
	}


	

}
