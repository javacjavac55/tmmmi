package com.tmmmi.service.domain;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class CalendarMovie {
	private String movieCd;
	private String movieNm;
	private String movieNmEn;
	private long openDt;

	public CalendarMovie() {
		// TODO Auto-generated constructor stub
	}

	public String getMovieCd() {
		return movieCd;
	}

	public void setMovieCd(String movieCd) {
		this.movieCd = movieCd;
	}

	public String getMovieNm() {
		return movieNm;
	}

	public void setMovieNm(String movieNm) {
		this.movieNm = movieNm;
	}

	public String getMovieNmEn() {
		return movieNmEn;
	}

	public void setMovieNmEn(String movieNmEn) {
		this.movieNmEn = movieNmEn;
	}

	public long getOpenDt() {
		return openDt;
	}

	public void setOpenDt(long openDt) {
		this.openDt = openDt;
	}
}