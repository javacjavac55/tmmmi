package com.tmmmi.service.domain;

public class ContentSport {
	
	private int sectionNo;
	private int sportNo;
	private String sportTitle;
	private String sportLink;
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

	public String getSportLink() {
		return sportLink;
	}

	public void setSportLink(String sportLink) {
		this.sportLink = sportLink;
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

	@Override
	public String toString() {
		return "ContentSport [sectionNo=" + sectionNo + ", sportNo=" + sportNo + ", sportTitle=" + sportTitle
				+ ", sportLink=" + sportLink + ", sportThumbnail=" + sportThumbnail + ", sportVideo=" + sportVideo
				+ "]";
	}
	
}
