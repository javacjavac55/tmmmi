package com.tmmmi.service.domain;

import java.sql.Date;

public class Scrap {
	
	private int scrapNo;
	private int userNo;
	private int sectionNo;
	private String sectionName;
	private String scrapTitle;
	private String scrapDetail;
	private Date scrapDate;
	private int scrapCheck;
	private String scrapLink;
	private int scrapType;

	public Scrap() {
		// TODO Auto-generated constructor stub
	}

	public int getScrapNo() {
		return scrapNo;
	}

	public void setScrapNo(int scrapNo) {
		this.scrapNo = scrapNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getSectionNo() {
		return sectionNo;
	}

	public void setSectionNo(int sectionNo) {
		this.sectionNo = sectionNo;
	}

	public String getSectionName() {
		return sectionName;
	}

	public void setSectionName(String sectionName) {
		this.sectionName = sectionName;
	}

	public String getScrapTitle() {
		return scrapTitle;
	}

	public void setScrapTitle(String scrapTitle) {
		this.scrapTitle = scrapTitle;
	}

	public String getScrapDetail() {
		return scrapDetail;
	}

	public void setScrapDetail(String scrapDetail) {
		this.scrapDetail = scrapDetail;
	}

	public Date getScrapDate() {
		return scrapDate;
	}

	public void setScrapDate(Date scrapDate) {
		this.scrapDate = scrapDate;
	}

	public int getScrapCheck() {
		return scrapCheck;
	}

	public void setScrapCheck(int scrapCheck) {
		this.scrapCheck = scrapCheck;
	}

	public String getScrapLink() {
		return scrapLink;
	}

	public void setScrapLink(String scrapLink) {
		this.scrapLink = scrapLink;
	}

	public int getScrapType() {
		return scrapType;
	}

	public void setScrapType(int scrapType) {
		this.scrapType = scrapType;
	}

	@Override
	public String toString() {
		return "Scrap [scrapNo=" + scrapNo + ", userNo=" + userNo + ", sectionNo=" + sectionNo + ", sectionName="
				+ sectionName + ", scrapTitle=" + scrapTitle + ", scrapDetail=" + scrapDetail + ", scrapDate="
				+ scrapDate + ", scrapCheck=" + scrapCheck + ", scrapLink=" + scrapLink + ", scrapType=" + scrapType
				+ "]";
	}

}
