package com.tmmmi.service.domain;

import java.sql.Date;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.codehaus.jackson.annotate.JsonProperty;
@JsonIgnoreProperties(ignoreUnknown = true)
public class ContentTasty {
	
	///Field
	private int sectionNo;
	@JsonProperty("title")
	private String tastyTitle;
	private Date tastyRegDate;
	@JsonProperty("mapx")
	private String tastyLocationX;
	@JsonProperty("mapy")
	private String tastyLocationY;
	@JsonProperty("category")
	private String tastyMenu;
	@JsonProperty("roadAddress")
	private String tastyAddress;
	@JsonProperty("telephone")
	private String tastyTel;
	@JsonProperty("link")
	private String tastyLink;
	
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

	public String getTastyAddress() {
		return tastyAddress;
	}

	public void setTastyAddress(String tastyAddress) {
		this.tastyAddress = tastyAddress;
	}

	public String getTastyTel() {
		return tastyTel;
	}

	public void setTastyTel(String tastyTel) {
		this.tastyTel = tastyTel;
	}

	public String getTastyLink() {
		return tastyLink;
	}

	public void setTastyLink(String tastyLink) {
		this.tastyLink = tastyLink;
	}

	@Override
	public String toString() {
		return "ContentTasty [sectionNo=" + sectionNo + ", tastyTitle=" + tastyTitle + ", tastyRegDate=" + tastyRegDate
				+ ", tastyLocationX=" + tastyLocationX + ", tastyLocationY=" + tastyLocationY + ", tastyMenu="
				+ tastyMenu + ", tastyAddress=" + tastyAddress + ", tastyTel=" + tastyTel + ", tastyLink=" + tastyLink
				+ "]";
	}

}
