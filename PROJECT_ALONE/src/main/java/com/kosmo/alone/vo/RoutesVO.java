package com.kosmo.alone.vo;

import org.springframework.web.multipart.MultipartFile;

public class RoutesVO {
	
	private int rouPk;
	private String rouName;
	private String rouRegdate;
	private String rouImg;
	private String rouDetail;
	private int rouView;
	
	private MultipartFile ufile;
	
	public int getRouPk() {
		return rouPk;
	}
	public void setRouPk(int rouPk) {
		this.rouPk = rouPk;
	}
	public String getRouName() {
		return rouName;
	}
	public void setRouName(String rouName) {
		this.rouName = rouName;
	}
	public String getRouRegdate() {
		return rouRegdate;
	}
	public void setRouRegdate(String rouRegdate) {
		this.rouRegdate = rouRegdate;
	}
	public String getRouImg() {
		return rouImg;
	}
	public void setRouImg(String rouImg) {
		this.rouImg = rouImg;
	}
	public String getRouDetail() {
		return rouDetail;
	}
	public void setRouDetail(String rouDetail) {
		this.rouDetail = rouDetail;
	}
	public int getRouView() {
		return rouView;
	}
	public void setRouView(int rouView) {
		this.rouView = rouView;
	}
	
	public MultipartFile getUfile() {
		return ufile;
	}
	public void setUfile(MultipartFile ufile) {
		this.ufile = ufile;
	}
	
}
