package com.tmmmi.service.domain;

import java.sql.Date;

public class QNA {
	
	private int userNo;
	private int QNANo;
	private int QNACategory;
	private String QNATitle;
	private String QNADetail;
	private String QNAImage;
	private Date QNADate;
	private int QNAAnswerCheck;
	private String QNAAnswerDetail;
	private Date QNAAnswerDate;

	public QNA() {
		// TODO Auto-generated constructor stub
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getQNANo() {
		return QNANo;
	}

	public void setQNANo(int qNANo) {
		QNANo = qNANo;
	}

	public int getQNACategory() {
		return QNACategory;
	}

	public void setQNACategory(int qNACategory) {
		QNACategory = qNACategory;
	}

	public String getQNATitle() {
		return QNATitle;
	}

	public void setQNATitle(String qNATitle) {
		QNATitle = qNATitle;
	}

	public String getQNADetail() {
		return QNADetail;
	}

	public void setQNADetail(String qNADetail) {
		QNADetail = qNADetail;
	}

	public String getQNAImage() {
		return QNAImage;
	}

	public void setQNAImage(String qNAImage) {
		QNAImage = qNAImage;
	}

	public Date getQNADate() {
		return QNADate;
	}

	public void setQNADate(Date qNADate) {
		QNADate = qNADate;
	}

	public int getQNAAnswerCheck() {
		return QNAAnswerCheck;
	}

	public void setQNAAnswerCheck(int qNAAnswerCheck) {
		QNAAnswerCheck = qNAAnswerCheck;
	}

	public String getQNAAnswerDetail() {
		return QNAAnswerDetail;
	}

	public void setQNAAnswerDetail(String qNAAnswerDetail) {
		QNAAnswerDetail = qNAAnswerDetail;
	}

	public Date getQNAAnswerDate() {
		return QNAAnswerDate;
	}

	public void setQNAAnswerDate(Date qNAAnswerDate) {
		QNAAnswerDate = qNAAnswerDate;
	}

	@Override
	public String toString() {
		return "QNA [userNo=" + userNo + ", QNANo=" + QNANo + ", QNACategory=" + QNACategory + ", QNATitle=" + QNATitle
				+ ", QNADetail=" + QNADetail + ", QNAImage=" + QNAImage + ", QNADate=" + QNADate + ", QNAAnswerCheck="
				+ QNAAnswerCheck + ", QNAAnswerDetail=" + QNAAnswerDetail + ", QNAAnswerDate=" + QNAAnswerDate + "]";
	}

	
}