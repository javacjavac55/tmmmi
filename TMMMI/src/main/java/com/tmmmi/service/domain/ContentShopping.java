package com.tmmmi.service.domain;

public class ContentShopping {
	
	private int sectionNo;
	private String reviewNo;
	private String shoppingTitle;
	private String shoppingLink;
	private int shoppingPrice;
	private String shoppingThumbnail;
	private String shoppingVideoTitle;
	private String shoppingVideoDetail;
	private String shoppingVideoThumbnail;
	private String shoppingVideoChannel;
	private String shoppingVideoId;
	
	public ContentShopping() {
		super();
	}

	public int getSectionNo() {
		return sectionNo;
	}

	public void setSectionNo(int sectionNo) {
		this.sectionNo = sectionNo;
	}

	public String getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(String reviewNo) {
		this.reviewNo = reviewNo;
	}

	public String getShoppingTitle() {
		return shoppingTitle;
	}

	public void setShoppingTitle(String shoppingTitle) {
		this.shoppingTitle = shoppingTitle;
	}

	public String getShoppingLink() {
		return shoppingLink;
	}

	public void setShoppingLink(String shoppingLink) {
		this.shoppingLink = shoppingLink;
	}

	public int getShoppingPrice() {
		return shoppingPrice;
	}

	public void setShoppingPrice(int shoppingPrice) {
		this.shoppingPrice = shoppingPrice;
	}

	public String getShoppingThumbnail() {
		return shoppingThumbnail;
	}

	public void setShoppingThumbnail(String shoppingThumbnail) {
		this.shoppingThumbnail = shoppingThumbnail;
	}

	public String getShoppingVideoTitle() {
		return shoppingVideoTitle;
	}

	public void setShoppingVideoTitle(String shoppingVideoTitle) {
		this.shoppingVideoTitle = shoppingVideoTitle;
	}

	public String getShoppingVideoDetail() {
		return shoppingVideoDetail;
	}

	public void setShoppingVideoDetail(String shoppingVideoDetail) {
		this.shoppingVideoDetail = shoppingVideoDetail;
	}

	public String getShoppingVideoThumbnail() {
		return shoppingVideoThumbnail;
	}

	public void setShoppingVideoThumbnail(String shoppingVideoThumbnail) {
		this.shoppingVideoThumbnail = shoppingVideoThumbnail;
	}

	public String getShoppingVideoChannel() {
		return shoppingVideoChannel;
	}

	public void setShoppingVideoChannel(String shoppingVideoChannel) {
		this.shoppingVideoChannel = shoppingVideoChannel;
	}

	public String getShoppingVideoId() {
		return shoppingVideoId;
	}

	public void setShoppingVideoId(String shoppingVideoId) {
		this.shoppingVideoId = shoppingVideoId;
	}

	@Override
	public String toString() {
		return "ContentShopping [sectionNo=" + sectionNo + ", reviewNo=" + reviewNo + ", shoppingTitle=" + shoppingTitle
				+ ", shoppingLink=" + shoppingLink + ", shoppingPrice=" + shoppingPrice + ", shoppingThumbnail="
				+ shoppingThumbnail + ", shoppingVideoTitle=" + shoppingVideoTitle + ", shoppingVideoDetail="
				+ shoppingVideoDetail + ", shoppingVideoThumbnail=" + shoppingVideoThumbnail + ", shoppingVideoChannel="
				+ shoppingVideoChannel + ", shoppingVideoId=" + shoppingVideoId + "]";
	}
	
}