package com.kosmo.alone.vo;

import org.springframework.social.oauth2.AccessGrant;

public class infoVO {
	
	private AccessGrant accessGrant;
	private String accessToken;
	private String refreshToken;
	private Long expireTime;
	
	
	public AccessGrant getAccessGrant() {
		return accessGrant;
	}
	public void setAccessGrant(AccessGrant accessGrant) {
		this.accessGrant = accessGrant;
	}
	public String getAccessToken() {
		return accessToken;
	}
	public void setAccessToken(String accessToken) {
		this.accessToken = accessToken;
	}
	public String getRefreshToken() {
		return refreshToken;
	}
	public void setRefreshToken(String refreshToken) {
		this.refreshToken = refreshToken;
	}
	public Long getExpireTime() {
		return expireTime;
	}
	public void setExpireTime(Long expireTime) {
		this.expireTime = expireTime;
	}
	
}
