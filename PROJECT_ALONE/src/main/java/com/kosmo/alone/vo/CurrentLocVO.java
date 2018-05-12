package com.kosmo.alone.vo;

public class CurrentLocVO {
	
	private int monPk;
	private int curPk;
	private double curLat;
	private double curLng;
	private String curRegdate;
	private int curIson;
	private int sseq;
	private int eseq;
	private String latitude;
	private String longitude;
	
	
	public String getLatitude() {
		return latitude;
	}
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	public String getLongitude() {
		return longitude;
	}
	public void setLongitude(String longitude) {
		this.longitude = longitude;
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
	public int getCurPk() {
		return curPk;
	}
	public void setCurPk(int curPk) {
		this.curPk = curPk;
	}
	public double getCurLat() {
		return curLat;
	}
	public void setCurLat(double curLat) {
		this.curLat = curLat;
	}
	public double getCurLng() {
		return curLng;
	}
	public void setCurLng(double curLng) {
		this.curLng = curLng;
	}
	public String getCurRegdate() {
		return curRegdate;
	}
	public void setCurRegdate(String curRegdate) {
		this.curRegdate = curRegdate;
	}
	public int getCurIson() {
		return curIson;
	}
	public void setCurIson(int curIson) {
		this.curIson = curIson;
	}

}
