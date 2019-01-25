package com.tmmmi.service.domain;

public class ContentMovie {
	
	private int sectionNo;
	private int movieNo;
	private String movieTitle;
	private String movieDetail;
	private String movieDirector;
	private String movieActor;
	private String movieRating;	
	private String movieThumbnail;
	private String movieVideo;
	private String movieLink;
	
	//Box Office
	private String movieOpenDate;
	private String movieDayAudience;
	private String movieTotalAudience;
	
	public ContentMovie() {
		// TODO Auto-generated constructor stub
	}

	public int getSectionNo() {
		return sectionNo;
	}

	public void setSectionNo(int sectionNo) {
		this.sectionNo = sectionNo;
	}

	public int getMovieNo() {
		return movieNo;
	}

	public void setMovieNo(int movieNo) {
		this.movieNo = movieNo;
	}

	public String getMovieTitle() {
		return movieTitle;
	}

	public void setMovieTitle(String movieTitle) {
		this.movieTitle = movieTitle;
	}

	public String getMovieDetail() {
		return movieDetail;
	}

	public void setMovieDetail(String movieDetail) {
		this.movieDetail = movieDetail;
	}

	public String getMovieDirector() {
		return movieDirector;
	}

	public void setMovieDirector(String movieDirector) {
		this.movieDirector = movieDirector;
	}

	public String getMovieActor() {
		return movieActor;
	}

	public void setMovieActor(String movieActor) {
		this.movieActor = movieActor;
	}

	public String getMovieRating() {
		return movieRating;
	}

	public void setMovieRating(String movieRating) {
		this.movieRating = movieRating;
	}

	public String getMovieThumbnail() {
		return movieThumbnail;
	}

	public void setMovieThumbnail(String movieThumbnail) {
		this.movieThumbnail = movieThumbnail;
	}

	public String getMovieVideo() {
		return movieVideo;
	}

	public void setMovieVideo(String movieVideo) {
		this.movieVideo = movieVideo;
	}

	public String getMovieLink() {
		return movieLink;
	}

	public void setMovieLink(String movieLink) {
		this.movieLink = movieLink;
	}

	public String getMovieOpenDate() {
		return movieOpenDate;
	}

	public void setMovieOpenDate(String movieOpenDate) {
		this.movieOpenDate = movieOpenDate;
	}

	public String getMovieDayAudience() {
		return movieDayAudience;
	}

	public void setMovieDayAudience(String movieDayAudience) {
		this.movieDayAudience = movieDayAudience;
	}

	public String getMovieTotalAudience() {
		return movieTotalAudience;
	}

	public void setMovieTotalAudience(String movieTotalAudience) {
		this.movieTotalAudience = movieTotalAudience;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("ContentMovie [sectionNo=");
		builder.append(sectionNo);
		builder.append(", movieNo=");
		builder.append(movieNo);
		builder.append(", movieTitle=");
		builder.append(movieTitle);
		builder.append(", movieDetail=");
		builder.append(movieDetail);
		builder.append(", movieDirector=");
		builder.append(movieDirector);
		builder.append(", movieActor=");
		builder.append(movieActor);
		builder.append(", movieRating=");
		builder.append(movieRating);
		builder.append(", movieThumbnail=");
		builder.append(movieThumbnail);
		builder.append(", movieVideo=");
		builder.append(movieVideo);
		builder.append(", movieLink=");
		builder.append(movieLink);
		builder.append(", movieOpenDate=");
		builder.append(movieOpenDate);
		builder.append(", movieDayAudience=");
		builder.append(movieDayAudience);
		builder.append(", movieTotalAudience=");
		builder.append(movieTotalAudience);
		builder.append("]");
		return builder.toString();
	}
}
