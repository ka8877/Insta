package com.kosmo.alone.vo;

import org.springframework.web.multipart.MultipartFile;

public class BoardsVO {
	
	private int monPk;
	private int catePk;
	private int boaPk;
	private String boaTitle;
	private String boaCon;
	private String boaRegdate;
	private String cateName;
	private String boaUrl;
	private int sseq;
	private int eseq;
	private int boaGubun;
	private MultipartFile Filedata;
	private int rcnt;
	private int scnt;
	private String monName;
	
	public int getRcnt() {
		return rcnt;
	}
	public void setRcnt(int rcnt) {
		this.rcnt = rcnt;
	}
	public int getScnt() {
		return scnt;
	}
	public void setScnt(int scnt) {
		this.scnt = scnt;
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
	public int getCatePk() {
		return catePk;
	}
	public void setCatePk(int catePk) {
		this.catePk = catePk;
	}
	public int getBoaPk() {
		return boaPk;
	}
	public void setBoaPk(int boaPk) {
		this.boaPk = boaPk;
	}
	public String getBoaTitle() {
		return boaTitle;
	}
	public void setBoaTitle(String boaTitle) {
		this.boaTitle = boaTitle;
	}
	public String getBoaCon() {
		return boaCon;
	}
	public void setBoaCon(String boaCon) {
		this.boaCon = boaCon;
	}
	public String getBoaRegdate() {
		return boaRegdate;
	}
	public void setBoaRegdate(String boaRegdate) {
		this.boaRegdate = boaRegdate;
	}
	public String getCateName() {
		return cateName;
	}
	public void setCateName(String cateName) {
		this.cateName = cateName;
	}
	public String getBoaUrl() {
		return boaUrl;
	}
	public void setBoaUrl(String boaUrl) {
		this.boaUrl = boaUrl;
	}
	public int getBoaGubun() {
		return boaGubun;
	}
	public void setBoaGubun(int boaGubun) {
		this.boaGubun = boaGubun;
	}
	public MultipartFile getFiledata() {
		return Filedata;
	}
	public void setFiledata(MultipartFile filedata) {
		Filedata = filedata;
	}
	public String getMonName() {
		return monName;
	}
	public void setMonName(String monName) {
		this.monName = monName;
	}

}
