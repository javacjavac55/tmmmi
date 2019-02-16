package com.tmmmi.service.domain;

public class ContentUserKeyword {
	
	private String reviewNo;
	private String keywordTitle;
	private String keywordLink;
	private String keywordDescription;
	private String keywordVideo;
	private String keywordVideoId;
	private String keywordThumbnail;
	private String keywordNextToken;

	public ContentUserKeyword() {
		// TODO Auto-generated constructor stub
	}

	public String getReviewNo() {
		return reviewNo;
	}



	public void setReviewNo(String reviewNo) {
		this.reviewNo = reviewNo;
	}



	public String getKeywordTitle() {
		return keywordTitle;
	}

	public void setKeywordTitle(String keywordTitle) {
		this.keywordTitle = keywordTitle;
	}

	public String getKeywordLink() {
		return keywordLink;
	}

	public void setKeywordLink(String keywordLink) {
		this.keywordLink = keywordLink;
	}

	public String getKeywordDescription() {
		return keywordDescription;
	}

	public void setKeywordDescription(String keywordDescription) {
		this.keywordDescription = keywordDescription;
	}

	public String getKeywordVideo() {
		return keywordVideo;
	}

	public void setKeywordVideo(String keywordVideo) {
		this.keywordVideo = keywordVideo;
	}

	public String getKeywordVideoId() {
		return keywordVideoId;
	}

	public void setKeywordVideoId(String keywordVideoId) {
		this.keywordVideoId = keywordVideoId;
	}

	public String getKeywordThumbnail() {
		return keywordThumbnail;
	}

	public void setKeywordThumbnail(String keywordThumbnail) {
		this.keywordThumbnail = keywordThumbnail;
	}

	public String getKeywordNextToken() {
		return keywordNextToken;
	}

	public void setKeywordNextToken(String keywordNextToken) {
		this.keywordNextToken = keywordNextToken;
	}

	@Override
	public String toString() {
		return "ContentUserKeyword [reviewNo=" + reviewNo + ", keywordTitle=" + keywordTitle + ", keywordLink="
				+ keywordLink + ", keywordDescription=" + keywordDescription + ", keywordVideo=" + keywordVideo
				+ ", keywordVideoId=" + keywordVideoId + ", keywordThumbnail=" + keywordThumbnail
				+ ", keywordNextToken=" + keywordNextToken + "]";
	}

}
