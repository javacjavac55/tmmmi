package com.tmmmi.service.domain;

import java.sql.Date;

public class ContentTasty {
	
	///Field
	private int sectionNo;
	private String tastyTitle;
	private String tastyThumbnail;
	private Date tastyRegDate;
	private String tastyLocationX;
	private String tastyLocationY;
	private String tastyMenu;
	
	///Constructor
	public ContentTasty() {
	}

	public int getSectionNo() {
		return sectionNo;
	}

	public void setSectionNo(int sectionNo) {
		this.sectionNo = sectionNo;
	}

	public String getTastyTitle() {
		return tastyTitle;
	}

	public void setTastyTitle(String tastyTitle) {
		this.tastyTitle = tastyTitle;
	}

	public String getTastyThumbnail() {
		return tastyThumbnail;
	}

	public void setTastyThumbnail(String tastyThumbnail) {
		this.tastyThumbnail = tastyThumbnail;
	}

	public Date getTastyRegDate() {
		return tastyRegDate;
	}

	public void setTastyRegDate(Date tastyRegDate) {
		this.tastyRegDate = tastyRegDate;
	}

	public String getTastyLocationX() {
		return tastyLocationX;
	}

	public void setTastyLocationX(String tastyLocationX) {
		this.tastyLocationX = tastyLocationX;
	}

	public String getTastyLocationY() {
		return tastyLocationY;
	}

	public void setTastyLocationY(String tastyLocationY) {
		this.tastyLocationY = tastyLocationY;
	}

	public String getTastyMenu() {
		return tastyMenu;
	}

	public void setTastyMenu(String tastyMenu) {
		this.tastyMenu = tastyMenu;
	}
}
