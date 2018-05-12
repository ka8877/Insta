package com.kosmo.alone.vo;

public class PaymentsVO {
	
	private int monPk;
	private int proPk;
	private int payPk;
	private String payRegdate;
	
	public int getMonPk() {
		return monPk;
	}
	public void setMonPk(int monPk) {
		this.monPk = monPk;
	}
	public int getProPk() {
		return proPk;
	}
	public void setProPk(int proPk) {
		this.proPk = proPk;
	}
	public int getPayPk() {
		return payPk;
	}
	public void setPayPk(int payPk) {
		this.payPk = payPk;
	}
	public String getPayRegdate() {
		return payRegdate;
	}
	public void setPayRegdate(String payRegdate) {
		this.payRegdate = payRegdate;
	}

}
