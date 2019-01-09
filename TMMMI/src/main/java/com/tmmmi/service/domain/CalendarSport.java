package com.tmmmi.service.domain;

import java.sql.Date;

public class CalendarSport {

	private String leagueTitle;
	private Date matchDate;
	private String teamAway;
	private String teamHome;
	private int teamAwayScore;
	private int teamHomeScore;
	private String teamAwayEmblem;
	private String teamHomeEmblem;
	
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
		return teamAway;
	}

	public void setTeamAway(String teamAway) {
		this.teamAway = teamAway;
	}

	public String getTeamHome() {
		return teamHome;
	}

	public void setTeamHome(String teamHome) {
		this.teamHome = teamHome;
	}

	public int getTeamAwayScore() {
		return teamAwayScore;
	}

	public void setTeamAwayScore(int teamAwayScore) {
		this.teamAwayScore = teamAwayScore;
	}

	public int getTeamHomeScore() {
		return teamHomeScore;
	}

	public void setTeamHomeScore(int teamHomeScore) {
		this.teamHomeScore = teamHomeScore;
	}

	public String getTeamAwayEmblem() {
		return teamAwayEmblem;
	}

	public void setTeamAwayEmblem(String teamAwayEmblem) {
		this.teamAwayEmblem = teamAwayEmblem;
	}

	public String getTeamHomeEmblem() {
		return teamHomeEmblem;
	}

	public void setTeamHomeEmblem(String teamHomeEmblem) {
		this.teamHomeEmblem = teamHomeEmblem;
	}

}
