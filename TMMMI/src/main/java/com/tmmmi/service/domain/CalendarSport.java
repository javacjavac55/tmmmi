package com.tmmmi.service.domain;

public class CalendarSport {
	private int userCategoryNo;
	private String leagueTitle;
	private long matchDate;	
	private String gameStartTime;	
	private String awayTeamName;
	private String homeTeamName;
	private int awayTeamScore;
	private int homeTeamScore;
	private String awayTeamEmblem64URI;
	private String homeTeamEmblem64URI;
	
	public CalendarSport() {
	}

	public int getUserCategoryNo() {
		return userCategoryNo;
	}

	public void setUserCategoryNo(int userCategoryNo) {
		this.userCategoryNo = userCategoryNo;
	}

	public String getLeagueTitle() {
		return leagueTitle;
	}

	public void setLeagueTitle(String leagueTitle) {
		this.leagueTitle = leagueTitle;
	}

	public long getMatchDate() {
		return matchDate;
	}

	public void setMatchDate(long matchDate) {
		this.matchDate = matchDate;
	}

	public String getGameStartTime() {
		return gameStartTime;
	}

	public void setGameStartTime(String gameStartTime) {
		this.gameStartTime = gameStartTime;
	}

	public String getAwayTeamName() {
		return awayTeamName;
	}

	public void setAwayTeamName(String awayTeamName) {
		this.awayTeamName = awayTeamName;
	}

	public String getHomeTeamName() {
		return homeTeamName;
	}

	public void setHomeTeamName(String homeTeamName) {
		this.homeTeamName = homeTeamName;
	}

	public int getAwayTeamScore() {
		return awayTeamScore;
	}

	public void setAwayTeamScore(int awayTeamScore) {
		this.awayTeamScore = awayTeamScore;
	}

	public int getHomeTeamScore() {
		return homeTeamScore;
	}

	public void setHomeTeamScore(int homeTeamScore) {
		this.homeTeamScore = homeTeamScore;
	}

	public String getAwayTeamEmblem64URI() {
		return awayTeamEmblem64URI;
	}

	public void setAwayTeamEmblem64URI(String awayTeamEmblem64URI) {
		this.awayTeamEmblem64URI = awayTeamEmblem64URI;
	}

	public String getHomeTeamEmblem64URI() {
		return homeTeamEmblem64URI;
	}

	public void setHomeTeamEmblem64URI(String homeTeamEmblem64URI) {
		this.homeTeamEmblem64URI = homeTeamEmblem64URI;
	}
	@Override
	public String toString() {
		return "CalendarSport [userCategoryNo=" + userCategoryNo + ", leagueTitle=" + leagueTitle + ", matchDate="
				+ matchDate + ", gameStartTime=" + gameStartTime + ", awayTeamName=" + awayTeamName + ", homeTeamName="
				+ homeTeamName + ", awayTeamScore=" + awayTeamScore + ", homeTeamScore=" + homeTeamScore
				+ ", awayTeamEmblem64URI=" + awayTeamEmblem64URI + ", homeTeamEmblem64URI=" +" homeTeamEmblem64URI]";
	}

}
