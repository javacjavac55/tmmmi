package com.tmmmi.service.domain;

import java.sql.Date;

public class User {
	
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
	private String role;
	private boolean withdrawCheck;
	private Date withdrawDate;

	public User() {
		// TODO Auto-generated constructor stub
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

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public boolean isWithdrawCheck() {
		return withdrawCheck;
	}

	public void setWithdrawCheck(boolean withdrawCheck) {
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
		StringBuilder builder = new StringBuilder();
		builder.append("User [userNo=");
		builder.append(userNo);
		builder.append(", userId=");
		builder.append(userId);
		builder.append(", password=");
		builder.append(password);
		builder.append(", email=");
		builder.append(email);
		builder.append(", emailCheck=");
		builder.append(emailCheck);
		builder.append(", userName=");
		builder.append(userName);
		builder.append(", birthday=");
		builder.append(birthday);
		builder.append(", accessToken=");
		builder.append(accessToken);
		builder.append(", refreshToken=");
		builder.append(refreshToken);
		builder.append(", refreshTokenExpireTime=");
		builder.append(refreshTokenExpireTime);
		builder.append(", snsName=");
		builder.append(snsName);
		builder.append(", role=");
		builder.append(role);
		builder.append(", withdrawCheck=");
		builder.append(withdrawCheck);
		builder.append(", withdrawDate=");
		builder.append(withdrawDate);
		builder.append("]");
		return builder.toString();
	}

}
