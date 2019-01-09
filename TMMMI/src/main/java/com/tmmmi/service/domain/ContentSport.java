package com.tmmmi.service.domain;

public class ContentSport {
	
	private int sectionNo;
	private int sportNo;
	private String sportTitle;
	private String sportDetail;
	private String sportThumbnail;
	private String sportVideo;

	public ContentSport() {
		// TODO Auto-generated constructor stub
	}

	public int getSectionNo() {
		return sectionNo;
	}

	public void setSectionNo(int sectionNo) {
		this.sectionNo = sectionNo;
	}

	public int getSportNo() {
		return sportNo;
	}

	public void setSportNo(int sportNo) {
		this.sportNo = sportNo;
	}

	public String getSportTitle() {
		return sportTitle;
	}

	public void setSportTitle(String sportTitle) {
		this.sportTitle = sportTitle;
	}

	public String getSportDetail() {
		return sportDetail;
	}

	public void setSportDetail(String sportDetail) {
		this.sportDetail = sportDetail;
	}

	public String getSportThumbnail() {
		return sportThumbnail;
	}

	public void setSportThumbnail(String sportThumbnail) {
		this.sportThumbnail = sportThumbnail;
	}

	public String getSportVideo() {
		return sportVideo;
	}

	public void setSportVideo(String sportVideo) {
		this.sportVideo = sportVideo;
	}
	
}
