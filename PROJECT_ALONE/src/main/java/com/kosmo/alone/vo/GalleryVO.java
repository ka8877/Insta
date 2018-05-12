package com.kosmo.alone.vo;

import org.springframework.web.multipart.MultipartFile;

public class GalleryVO {
	
	private MultipartFile file1;
	private int monPk;
	private int galPk;
	private String galUrl;
	private String galRegdate;
	private String bfile_path;
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
	public String getBfile_path() {
		return bfile_path;
	}
	public void setBfile_path(String bfile_path) {
		this.bfile_path = bfile_path;
	}
	public String getBfile_name() {
		return bfile_name;
	}
	public void setBfile_name(String bfile_name) {
		this.bfile_name = bfile_name;
	}
	public long getBfile_size() {
		return bfile_size;
	}
	public void setBfile_size(long bfile_size) {
		this.bfile_size = bfile_size;
	}
	private String bfile_name;
	private long bfile_size;
	
	public int getMonPk() {
		return monPk;
	}
	public void setMonPk(int monPk) {
		this.monPk = monPk;
	}
	public int getGalPk() {
		return galPk;
	}
	public void setGalPk(int galPk) {
		this.galPk = galPk;
	}
	public String getGalUrl() {
		return galUrl;
	}
	public void setGalUrl(String galUrl) {
		this.galUrl = galUrl;
	}
	public String getGalRegdate() {
		return galRegdate;
	}
	public void setGalRegdate(String galRegdate) {
		this.galRegdate = galRegdate;
	}
	public MultipartFile getFile1() {
		return file1;
	}
	public void setFile1(MultipartFile file1) {
		this.file1 = file1;
	}

	

}
