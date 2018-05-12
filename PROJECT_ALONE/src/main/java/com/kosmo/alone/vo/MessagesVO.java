package com.kosmo.alone.vo;

public class MessagesVO {
	
	private int monPk;
	private int mesPk;
	private int mesReceiver;
	private String mesCon;
	private String mesRegdate;
	private int mesIsMatched;
	private int mesIsRead;
	private int unread;
	private MonstersVO monstersVO;
	
	
	
	public int getUnread() {
		return unread;
	}
	public void setUnread(int unread) {
		this.unread = unread;
	}
	public MonstersVO getMonstersVO() {
		return monstersVO;
	}
	public void setMonstersVO(MonstersVO monstersVO) {
		this.monstersVO = monstersVO;
	}
	public int getMonPk() {
		return monPk;
	}
	public void setMonPk(int monPk) {
		this.monPk = monPk;
	}
	public int getMesPk() {
		return mesPk;
	}
	public void setMesPk(int mesPk) {
		this.mesPk = mesPk;
	}
	public int getMesReceiver() {
		return mesReceiver;
	}
	public void setMesReceiver(int mesReceiver) {
		this.mesReceiver = mesReceiver;
	}
	public String getMesCon() {
		return mesCon;
	}
	public void setMesCon(String mesCon) {
		this.mesCon = mesCon;
	}
	public String getMesRegdate() {
		return mesRegdate;
	}
	public void setMesRegdate(String mesRegdate) {
		this.mesRegdate = mesRegdate;
	}
	public int getMesIsMatched() {
		return mesIsMatched;
	}
	public void setMesIsMatched(int mesIsMatched) {
		this.mesIsMatched = mesIsMatched;
	}
	public int getMesIsRead() {
		return mesIsRead;
	}
	public void setMesIsRead(int mesIsRead) {
		this.mesIsRead = mesIsRead;
	}
	
	

}
