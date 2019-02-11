package com.tmmmi.service.domain;

import java.sql.Date;

public class User {
	
	private String authNum;
	private int userNo;
	private String userId;
	private String password;
	private String email;
	private int emailCheck;
	private String userName;
	private Date birthday;
	private String accessToken;
	private String refreshToken;
	private String refreshTokenExpireTime;
	private int snsName;
	private int role;
	private int withdrawCheck;
	private Date withdrawDate;
	

	public User() {
		// TODO Auto-generated constructor stub
	}


	public String getAuthNum() {
		return authNum;
	}



	public void setAuthNum(String authNum) {
		this.authNum = authNum;
	}



	public int getUserNo() {
		return userNo;
	}



	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}



	public String getUserId() {
		return userId;
	}



	public void setUserId(String userId) {
		this.userId = userId;
	}



	public String getPassword() {
		return password;
	}



	public void setPassword(String password) {
		this.password = password;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public int getEmailCheck() {
		return emailCheck;
	}



	public void setEmailCheck(int emailCheck) {
		this.emailCheck = emailCheck;
	}



	public String getUserName() {
		return userName;
	}



	public void setUserName(String userName) {
		this.userName = userName;
	}



	public Date getBirthday() {
		return birthday;
	}



	public void setBirthday(Date birthday) {
		this.birthday = birthday;
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



	public String getRefreshTokenExpireTime() {
		return refreshTokenExpireTime;
	}



	public void setRefreshTokenExpireTime(String refreshTokenExpireTime) {
		this.refreshTokenExpireTime = refreshTokenExpireTime;
	}



	public int getSnsName() {
		return snsName;
	}



	public void setSnsName(int snsName) {
		this.snsName = snsName;
	}



	public int getRole() {
		return role;
	}



	public void setRole(int role) {
		this.role = role;
	}



	public int getWithdrawCheck() {
		return withdrawCheck;
	}



	public void setWithdrawCheck(int withdrawCheck) {
		this.withdrawCheck = withdrawCheck;
	}



	public Date getWithdrawDate() {
		return withdrawDate;
	}



	public void setWithdrawDate(Date withdrawDate) {
		this.withdrawDate = withdrawDate;
	}



	@Override
	public String toString() {
		return "User [authNum=" + authNum + ", userNo=" + userNo + ", userId=" + userId + ", password=" + password
				+ ", email=" + email + ", emailCheck=" + emailCheck + ", userName=" + userName + ", birthday="
				+ birthday + ", accessToken=" + accessToken + ", refreshToken=" + refreshToken
				+ ", refreshTokenExpireTime=" + refreshTokenExpireTime + ", snsName=" + snsName + ", role=" + role
				+ ", withdrawCheck=" + withdrawCheck + ", withdrawDate=" + withdrawDate + "]";
	}


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result + ((userId == null) ? 0 : userId.hashCode());
		return result;
	}


	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		User other = (User) obj;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (userId == null) {
			if (other.userId != null)
				return false;
		} else if (!userId.equals(other.userId))
			return false;
		return true;
	}

}
