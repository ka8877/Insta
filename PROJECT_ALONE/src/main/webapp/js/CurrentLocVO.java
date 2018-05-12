package com.kosmo.alone.vo;

public class CurrentLocVO {
	
	private int monPk;
	private int curPk;
	private int curLat;
	private int curLng;
	private String curRegdate;
	private int curIson;
	private int sseq;
	private int eseq;
	
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
	public int getCurLat() {
		return curLat;
	}
	public void setCurLat(int curLat) {
		this.curLat = curLat;
	}
	public int getCurLng() {
		return curLng;
	}
	public void setCurLng(int curLng) {
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
