package com.tmmmi.service.domain;

public class ContentUserKeyword {
	
	private int sectionNo;
	private String keywordTitle;
	private String keywordLink;
	private String keywordDescription;
	private String keywordVideo;
	private String keywordVideoId;

	public ContentUserKeyword() {
		// TODO Auto-generated constructor stub
	}

	public int getSectionNo() {
		return sectionNo;
	}

	public void setSectionNo(int sectionNo) {
		this.sectionNo = sectionNo;
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

	@Override
	public String toString() {
		return "ContentUserKeyword [sectionNo=" + sectionNo + ", keywordTitle=" + keywordTitle + ", keywordLink="
				+ keywordLink + ", keywordDescription=" + keywordDescription + ", keywordVideo=" + keywordVideo
				+ ", keywordVideoId=" + keywordVideoId + "]";
	}

}
