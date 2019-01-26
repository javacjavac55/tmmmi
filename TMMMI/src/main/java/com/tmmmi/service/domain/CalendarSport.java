package com.tmmmi.service.domain;

import java.sql.Date;

public class CalendarSport {

	private String leagueTitle;
	private Date matchDate;
	private String gameStartTime;	
	private String awayTeamName;
	private String homeTeamName;
	private int awayTeamScore;
	private int homeTeamScore;
	private String awayTeamEmblem64URI;
	private String homeTeamEmblem64URI;
	
	public CalendarSport() {
	}

	public String getLeagueTitle() {
		return leagueTitle;
	}

	public void setLeagueTitle(String leagueTitle) {
		this.leagueTitle = leagueTitle;
	}

	public Date getMatchDate() {
		return matchDate;
	}

	public void setMatchDate(Date matchDate) {
		this.matchDate = matchDate;
	}

	public String getTeamAway() {
		return awayTeamName;
	}

	public void setTeamAway(String awayTeamName) {
		this.awayTeamName = awayTeamName;
	}

	public String getTeamHome() {
		return homeTeamName;
	}

	public void setTeamHome(String homeTeamName) {
		this.homeTeamName = homeTeamName;
	}

	public int getTeamAwayScore() {
		return awayTeamScore;
	}

	public void setTeamAwayScore(int awayTeamScore) {
		this.awayTeamScore = awayTeamScore;
	}

	public int getTeamHomeScore() {
		return homeTeamScore;
	}

	public void setTeamHomeScore(int homeTeamScore) {
		this.homeTeamScore = homeTeamScore;
	}

	public String getTeamAwayEmblem() {
		return awayTeamEmblem64URI;
	}

	public void setTeamAwayEmblem(String awayTeamEmblem64URI) {
		this.awayTeamEmblem64URI = awayTeamEmblem64URI;
	}

	public String getTeamHomeEmblem() {
		return homeTeamEmblem64URI;
	}

	public void setTeamHomeEmblem(String homeTeamEmblem64URI) {
		this.homeTeamEmblem64URI = homeTeamEmblem64URI;
	}

	public String getMatchTime() {
		return gameStartTime;
	}

	public void setMatchTime(String gameStartTime) {
		this.gameStartTime = gameStartTime;
	}
	
	@Override
	public String toString() {
		return "CalendarSport [leagueTitle=" + leagueTitle + ", matchDate=" + matchDate + ", gameStartTime=" + gameStartTime
				+ ", awayTeamName=" + awayTeamName + ", homeTeamName=" + homeTeamName + ", awayTeamScore=" + awayTeamScore
				+ ", homeTeamScore=" + homeTeamScore + ", awayTeamEmblem64URI=" + awayTeamEmblem64URI + ", homeTeamEmblem64URI="
				+ homeTeamEmblem64URI + "]";
	}


}
