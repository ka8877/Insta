package com.kosmo.alone.vo;

public class HotRoutesVO {
	
	private int hotRouPk;
	private int hotPk;
	private int rouPk;
	private String hotRouRegdate;
	private int rouOrder;
	private int[] hotArray;

	public int[] getHotArray() {
		return hotArray;
	}
	public void setHotArray(int[] hotArray) {
		this.hotArray = hotArray;
	}
	
	public int getHotRouPk() {
		return hotRouPk;
	}
	public void setHotRouPk(int hotRouPk) {
		this.hotRouPk = hotRouPk;
	}
	public int getHotPk() {
		return hotPk;
	}
	public void setHotPk(int hotPk) {
		this.hotPk = hotPk;
	}
	public int getRouPk() {
		return rouPk;
	}
	public void setRouPk(int rouPk) {
		this.rouPk = rouPk;
	}
	public String getHotRouRegdate() {
		return hotRouRegdate;
	}
	public void setHotRouRegdate(String hotRouRegdate) {
		this.hotRouRegdate = hotRouRegdate;
	}
	public int getRouOrder() {
		return rouOrder;
	}
	public void setRouOrder(int rouOrder) {
		this.rouOrder = rouOrder;
	}

}
