package com.tmmmi.service.domain;

import java.sql.Date;

public class CalendarMovie {
	
	private String movieTitle;
	private Date movieOpenDate;

	public CalendarMovie() {
	}

	public String getMovieTitle() {
		return movieTitle;
	}

	public void setMovieTitle(String movieTitle) {
		this.movieTitle = movieTitle;
	}

	public Date getMovieOpenDate() {
		return movieOpenDate;
	}

	public void setMovieOpenDate(Date movieOpenDate) {
		this.movieOpenDate = movieOpenDate;
	}
	
}
