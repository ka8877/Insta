package com.kosmo.alone.vo;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

public class MonstersVO {

	private MultipartFile file;
	
	private int monPk;
	private String monName;
	private String monEmail;
	private String monBirthday;
	private String monSex;
	private String monTel;
	private int monActivate;
	private int monCharged;
	private String monRegdate;
	private String monProfile;
	private int monLoveball;
	private String monIntro;
	private String monToken;
	private String monBirth1;
	private String monBirth2;
	private String monBirth3;
	private int sseq;
	private int eseq;
	private CurrentLocVO currentLocVO;
	private DestinationVO destinationVO;
	private LikesVO likesVO;
	private String monId;
	
	public CurrentLocVO getCurrentLocVO() {
		return currentLocVO;
	}
	public void setCurrentLocVO(CurrentLocVO currentLocVO) {
		this.currentLocVO = currentLocVO;
	}
	public DestinationVO getDestinationVO() {
		return destinationVO;
	}
	public void setDestinationVO(DestinationVO destinationVO) {
		this.destinationVO = destinationVO;
	}
	public LikesVO getLikesVO() {
		return likesVO;
	}
	public void setLikesVO(LikesVO likesVO) {
		this.likesVO = likesVO;
	}
	private ArrayList<LikesVO> likeList;
	
	private ArrayList<ProductsVO> paymentsList;
	
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
	public String getMonBirth1() {
		return monBirth1;
	}
	public void setMonBirth1(String monBirth1) {
		this.monBirth1 = monBirth1;
	}
	public String getMonBirth2() {
		return monBirth2;
	}
	public void setMonBirth2(String monBirth2) {
		this.monBirth2 = monBirth2;
	}
	public String getMonBirth3() {
		return monBirth3;
	}
	public void setMonBirth3(String monBirth3) {
		this.monBirth3 = monBirth3;
	}
	public int getMonPk() {
		return monPk;
	}
	public void setMonPk(int monPk) {
		this.monPk = monPk;
	}
	public String getMonName() {
		return monName;
	}
	public void setMonName(String monName) {
		this.monName = monName;
	}
	public String getMonEmail() {
		return monEmail;
	}
	public void setMonEmail(String monEmail) {
		this.monEmail = monEmail;
	}
	public String getMonBirthday() {
		return monBirthday;
	}
	public void setMonBirthday(String monBirthday) {
		this.monBirthday = monBirthday;
	}
	public String getMonSex() {
		return monSex;
	}
	public void setMonSex(String monSex) {
		this.monSex = monSex;
	}
	public String getMonTel() {
		return monTel;
	}
	public void setMonTel(String monTel) {
		this.monTel = monTel;
	}
	public int getMonActivate() {
		return monActivate;
	}
	public void setMonActivate(int monActivate) {
		this.monActivate = monActivate;
	}
	public int getMonCharged() {
		return monCharged;
	}
	public void setMonCharged(int monCharged) {
		this.monCharged = monCharged;
	}
	public String getMonRegdate() {
		return monRegdate;
	}
	public void setMonRegdate(String monRegdate) {
		this.monRegdate = monRegdate;
	}
	public String getMonProfile() {
		return monProfile;
	}
	public void setMonProfile(String monProfile) {
		this.monProfile = monProfile;
	}
	public int getMonLoveball() {
		return monLoveball;
	}
	public void setMonLoveball(int monLoveball) {
		this.monLoveball = monLoveball;
	}
	public String getMonIntro() {
		return monIntro;
	}
	public void setMonIntro(String monIntro) {
		this.monIntro = monIntro;
	}
	public String getMonToken() {
		return monToken;
	}
	public void setMonToken(String monToken) {
		this.monToken = monToken;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public ArrayList<LikesVO> getLikeList() {
		return likeList;
	}
	public void setLikeList(ArrayList<LikesVO> likeList) {
		this.likeList = likeList;
	}
	public ArrayList<ProductsVO> getPaymentsList() {
		return paymentsList;
	}
	public void setPaymentsList(ArrayList<ProductsVO> paymentsList) {
		this.paymentsList = paymentsList;
	}
	public String getMonId() {
		return monId;
	}
	public void setMonId(String monId) {
		this.monId = monId;
	}
	
	
	

}
