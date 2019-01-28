package com.tmmmi.service.calendarsport.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.codehaus.jackson.map.ObjectMapper;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

import com.tmmmi.service.domain.CalendarSport;

@Configuration
@EnableScheduling
public class ScheduleSportTaskExecutor {
	@Autowired
	@Qualifier("sqlSessionTemplateBatch")
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Scheduled(cron="0 0 10 * * ?")
	//@Scheduled(cron="0 */13 * ? * *")
	public void executor() throws Exception{
		kSoccerData();
		wSoccerData();
		kBaseballData();
		wBaseballData();
		kBasketballData();
		wBasketballData();		
	}
	public void kSoccerData() throws Exception {
		for (int month = 3; month < 21; month++) {
			if (month < 13) {
				String address = "https://sports.news.naver.com/kfootball/schedule/index.nhn?category=kleague&year=2018&month="
						+ month;

				System.out.println("2018��" + address);

				Document doc = Jsoup.connect(address).header("User-Agent", "Mozilla/5.0").get();

				ObjectMapper mapper = new ObjectMapper();

				Result result = mapper.readValue(
						doc.html().split("monthlyScheduleModel: ")[1].split(",\n		seasonList")[0], Result.class);

				

				for (String key : result.getDailyScheduleListMap().keySet()) {

					List<SportListResult> sportList = result.getDailyScheduleListMap().get(key);

					for (SportListResult element : sportList) {
						CalendarSport cs = new CalendarSport();

						int hrs = Integer.parseInt(element.getGameStartTime().split(":")[0]);
						int min = Integer.parseInt(element.getGameStartTime().split(":")[1]);
						int year = Integer.parseInt(key.substring(0, 4));
						int mm = Integer.parseInt(key.substring(4, 6));
						int dd = Integer.parseInt(key.substring(6, 8));

						Date date = new Date(year - 1900, mm - 1, dd, hrs, min);
						long millisecond = date.getTime();

						cs.setMatchDate(millisecond);
						cs.setGameStartTime(element.getGameStartTime());
						cs.setHomeTeamName(element.getHomeTeamName());
						cs.setHomeTeamScore(element.getHomeTeamScore());
						cs.setHomeTeamEmblem64URI(element.getHomeTeamEmblem64URI());
						cs.setAwayTeamName(element.getAwayTeamName());
						cs.setAwayTeamScore(element.getAwayTeamScore());
						cs.setAwayTeamEmblem64URI(element.getAwayTeamEmblem64URI());
						cs.setLeagueTitle("kLeague");
						cs.setUserCategoryNo(1);

						sqlSession.update("CalendarSportMapper.addCalendarSport", cs);
					}

				}
			} // if ��
			else if (12 < month && month < 21) {
				String address = "https://sports.news.naver.com/kfootball/schedule/index.nhn?category=kleague&year=2019&month="
						+ (month - 12);

				System.out.println("2019��" + address);

				Document doc = Jsoup.connect(address).header("User-Agent", "Mozilla/5.0").get();

				ObjectMapper mapper = new ObjectMapper();

				Result result = mapper.readValue(
						doc.html().split("monthlyScheduleModel: ")[1].split(",\n		seasonList")[0], Result.class);

				

				for (String key : result.getDailyScheduleListMap().keySet()) {

					List<SportListResult> sportList = result.getDailyScheduleListMap().get(key);

					for (SportListResult element : sportList) {
						CalendarSport cs = new CalendarSport();

						int hrs = Integer.parseInt(element.getGameStartTime().split(":")[0]);
						int min = Integer.parseInt(element.getGameStartTime().split(":")[1]);
						int year = Integer.parseInt(key.substring(0, 4));
						int mm = Integer.parseInt(key.substring(4, 6));
						int dd = Integer.parseInt(key.substring(6, 8));

						Date date = new Date(year - 1900, mm - 1, dd, hrs, min);
						long millisecond = date.getTime();

						cs.setMatchDate(millisecond);
						cs.setGameStartTime(element.getGameStartTime());
						cs.setHomeTeamName(element.getHomeTeamName());
						cs.setHomeTeamScore(element.getHomeTeamScore());
						cs.setHomeTeamEmblem64URI(element.getHomeTeamEmblem64URI());
						cs.setAwayTeamName(element.getAwayTeamName());
						cs.setAwayTeamScore(element.getAwayTeamScore());
						cs.setAwayTeamEmblem64URI(element.getAwayTeamEmblem64URI());
						cs.setLeagueTitle("kLeague");
						cs.setUserCategoryNo(1);

						sqlSession.update("CalendarSportMapper.addCalendarSport", cs);
					}

				}
				
				
			} // else if ��
		} // �� for �� ��
	}// KLEAGUE ��

	public void wSoccerData() throws Exception {
		for (int month = 8; month < 18; month++) {

			if (month < 13) {
				String address = "https://sports.news.naver.com/wfootball/schedule/index.nhn?category=epl&year=" + 2018
						+ "&month=" + month;

				System.out.println("2018��" + address);

				Document doc = Jsoup.connect(address).header("User-Agent", "Mozilla/5.0").get();

				ObjectMapper mapper = new ObjectMapper();

				Result result = mapper.readValue(
						doc.html().split("monthlyScheduleModel: ")[1].split(",\n		seasonList")[0], Result.class);

				

				for (String key : result.getDailyScheduleListMap().keySet()) {

					List<SportListResult> sportList = result.getDailyScheduleListMap().get(key);

					for (SportListResult element : sportList) {
						CalendarSport cs = new CalendarSport();

						int hrs = Integer.parseInt(element.getGameStartTime().split(":")[0]);
						int min = Integer.parseInt(element.getGameStartTime().split(":")[1]);
						int year = Integer.parseInt(key.substring(0, 4));
						int mm = Integer.parseInt(key.substring(4, 6));
						int dd = Integer.parseInt(key.substring(6, 8));

						Date date = new Date(year - 1900, mm - 1, dd, hrs, min);
						long millisecond = date.getTime();

						cs.setMatchDate(millisecond);
						cs.setGameStartTime(element.getGameStartTime());
						cs.setHomeTeamName(element.getHomeTeamName());
						cs.setHomeTeamScore(element.getHomeTeamScore());
						cs.setHomeTeamEmblem64URI(element.getHomeTeamEmblem64URI());
						cs.setAwayTeamName(element.getAwayTeamName());
						cs.setAwayTeamScore(element.getAwayTeamScore());
						cs.setAwayTeamEmblem64URI(element.getAwayTeamEmblem64URI());
						cs.setLeagueTitle("EPL");
						cs.setUserCategoryNo(2);

						sqlSession.update("CalendarSportMapper.addCalendarSport", cs);
					}

				}				
				

			} // if ��
			else if (12 < month && month < 18) {
				String address = "https://sports.news.naver.com/wfootball/schedule/index.nhn?category=epl&year=" + 2019
						+ "&month=" + (month - 12);

				System.out.println(address);

				Document doc = Jsoup.connect(address).header("User-Agent", "Mozilla/5.0").get();

				ObjectMapper mapper = new ObjectMapper();

				Result result = mapper.readValue(
						doc.html().split("monthlyScheduleModel: ")[1].split(",\n		seasonList")[0], Result.class);
				

				for (String key : result.getDailyScheduleListMap().keySet()) {

					List<SportListResult> sportList = result.getDailyScheduleListMap().get(key);

					for (SportListResult element : sportList) {
						CalendarSport cs = new CalendarSport();

						int hrs = Integer.parseInt(element.getGameStartTime().split(":")[0]);
						int min = Integer.parseInt(element.getGameStartTime().split(":")[1]);
						int year = Integer.parseInt(key.substring(0, 4));
						int mm = Integer.parseInt(key.substring(4, 6));
						int dd = Integer.parseInt(key.substring(6, 8));

						Date date = new Date(year - 1900, mm - 1, dd, hrs, min);
						long millisecond = date.getTime();

						cs.setMatchDate(millisecond);
						cs.setGameStartTime(element.getGameStartTime());
						cs.setHomeTeamName(element.getHomeTeamName());
						cs.setHomeTeamScore(element.getHomeTeamScore());
						cs.setHomeTeamEmblem64URI(element.getHomeTeamEmblem64URI());
						cs.setAwayTeamName(element.getAwayTeamName());
						cs.setAwayTeamScore(element.getAwayTeamScore());
						cs.setAwayTeamEmblem64URI(element.getAwayTeamEmblem64URI());
						cs.setLeagueTitle("EPL");
						cs.setUserCategoryNo(2);

						sqlSession.update("CalendarSportMapper.addCalendarSport", cs);
					}

				}
				
				
			} // else if ��
		} // �� for �� ��
	}// EPL��

	public void kBaseballData() throws Exception {
		for (int month = 3; month < 19; month++) {

			if (month < 12) {
				String address = "https://sports.news.naver.com/kbaseball/schedule/index.nhn?date=20190323&month="
						+ month + "&year=2018&teamCode=";

				Document doc = Jsoup.connect(address).header("User-Agent", "Mozilla/5.0").get();
				Elements contents = doc.select(".tb_wrap tr");

				
				String date = "";
				int yy = 2018;
				int mm = 0;
				int dd = 0;
				int hrs = 0;
				int min = 0;
				for (Element baseball : contents) {
					// System.out.println(baseball.text());

					CalendarSport cs = new CalendarSport();

					// date set
					if (baseball.getElementsByAttribute("rowspan").size() > 0) {
						date = baseball.select(".td_date strong").text();

					} else if (baseball.getElementsByTag("td").size() != 6
							&& baseball.getElementsByTag("td").size() != 7) {
						continue;
					}

					mm = Integer.parseInt(date.split("\\.")[0]);
					dd = Integer.parseInt(date.split("\\.")[1]);
					if (baseball.getElementsByClass("td_hour").text().equals("-")) {
						continue;
					}

					String gameStartTime = baseball.getElementsByClass("td_hour").text();
					hrs = Integer.parseInt(gameStartTime.split(":")[0]);
					min = Integer.parseInt(gameStartTime.split(":")[1]);

					Date matchDate = new Date(yy - 1900, mm - 1, dd, hrs, min);
					long millisecond = matchDate.getTime();

					// score set
					String score = baseball.getElementsByClass("td_score").text();
					if (baseball.getElementsByClass("td_score").text().equals("VS")) {
						score = "777:777";
					} else {
						score = baseball.getElementsByClass("td_score").text();
					}

					cs.setMatchDate(millisecond);
					cs.setGameStartTime(gameStartTime);
					cs.setHomeTeamName(baseball.getElementsByClass("team_lft").text());
					cs.setHomeTeamScore(Integer.parseInt(score.split(":")[0]));
					cs.setAwayTeamName(baseball.getElementsByClass("team_rgt").text());
					cs.setAwayTeamScore(Integer.parseInt(score.split(":")[1]));
					cs.setLeagueTitle("KBO");
					cs.setUserCategoryNo(3);
					System.out.println(cs);
					sqlSession.update("CalendarSportMapper.addCalendarSport", cs);
				} // enhanced for��
				
				
			} // if ��
			else if (11 < month && month < 19) {
				String address = "https://sports.news.naver.com/kbaseball/schedule/index.nhn?date=20190323&month="
						+ (month - 9) + "&year=2019&teamCode=";

				Document doc = Jsoup.connect(address).header("User-Agent", "Mozilla/5.0").get();
				Elements contents = doc.select(".tb_wrap tr");

				
				String date = "";
				int yy = 2019;
				int mm = 0;
				int dd = 0;
				int hrs = 0;
				int min = 0;
				for (Element baseball : contents) {
					// System.out.println(baseball.text());

					CalendarSport cs = new CalendarSport();

					// date set
					if (baseball.getElementsByAttribute("rowspan").size() > 0) {
						date = baseball.select(".td_date strong").text();

					} else if (baseball.getElementsByTag("td").size() != 6
							&& baseball.getElementsByTag("td").size() != 7) {
						continue;
					}

					mm = Integer.parseInt(date.split("\\.")[0]);
					dd = Integer.parseInt(date.split("\\.")[1]);
					if (baseball.getElementsByClass("td_hour").text().equals("-")) {
						continue;
					}

					String gameStartTime = baseball.getElementsByClass("td_hour").text();
					hrs = Integer.parseInt(gameStartTime.split(":")[0]);
					min = Integer.parseInt(gameStartTime.split(":")[1]);

					Date matchDate = new Date(yy - 1900, mm - 1, dd, hrs, min);
					long millisecond = matchDate.getTime();

					// score set
					String score = baseball.getElementsByClass("td_score").text();
					if (baseball.getElementsByClass("td_score").text().equals("VS")) {
						score = "777:777";
					} else {
						score = baseball.getElementsByClass("td_score").text();
					}

					cs.setMatchDate(millisecond);
					cs.setGameStartTime(gameStartTime);
					cs.setHomeTeamName(baseball.getElementsByClass("team_lft").text());
					cs.setHomeTeamScore(Integer.parseInt(score.split(":")[0]));
					cs.setAwayTeamName(baseball.getElementsByClass("team_rgt").text());
					cs.setAwayTeamScore(Integer.parseInt(score.split(":")[1]));
					cs.setLeagueTitle("KBO");
					cs.setUserCategoryNo(3);
					System.out.println(cs);
					sqlSession.update("CalendarSportMapper.addCalendarSport", cs);
				} // enhanced for��
				
				
			} // else if ��
		} // for�� ��
	}// KBO��

	public void wBaseballData() throws Exception {
		for (int month = 3; month < 18; month++) {
			if (month < 11) {
				String address = "https://sports.news.naver.com/wbaseball/schedule/index.nhn?category=mlb&year=2018&month="
						+ month;
				System.out.println("2018��" + address);
				Document doc = Jsoup.connect(address).header("User-Agent", "Mozilla/5.0").get();

				ObjectMapper mapper = new ObjectMapper();

				Result result = mapper.readValue(
						doc.html().split("monthlyScheduleModel: ")[1].split(",\r\n" + "		seasonList")[0],
						Result.class);
				

				for (String key : result.getDailyScheduleListMap().keySet()) {

					List<SportListResult> sportList = result.getDailyScheduleListMap().get(key);

					for (SportListResult element : sportList) {
						CalendarSport cs = new CalendarSport();

						int hrs = Integer.parseInt(element.getGameStartTime().split(":")[0]);
						int min = Integer.parseInt(element.getGameStartTime().split(":")[1]);
						int year = Integer.parseInt(key.substring(0, 4));
						int mm = Integer.parseInt(key.substring(4, 6));
						int dd = Integer.parseInt(key.substring(6, 8));

						Date date = new Date(year - 1900, mm - 1, dd, hrs, min);
						long millisecond = date.getTime();

						cs.setMatchDate(millisecond);
						cs.setGameStartTime(element.getGameStartTime());
						cs.setHomeTeamName(element.getHomeTeamName());
						cs.setHomeTeamScore(element.getHomeTeamScore());
						cs.setHomeTeamEmblem64URI(element.getHomeTeamEmblem64URI());
						cs.setAwayTeamName(element.getAwayTeamName());
						cs.setAwayTeamScore(element.getAwayTeamScore());
						cs.setAwayTeamEmblem64URI(element.getAwayTeamEmblem64URI());
						cs.setLeagueTitle("MLB");
						cs.setUserCategoryNo(4);

						sqlSession.update("CalendarSportMapper.addCalendarSport", cs);

					}				
					
				}
			} // if ��
			else if (10 < month && month < 18) {
				String address = "https://sports.news.naver.com/wbaseball/schedule/index.nhn?category=mlb&year=2019&month="
						+ (month - 8);
				System.out.println("2019��" + address);
				Document doc = Jsoup.connect(address).header("User-Agent", "Mozilla/5.0").get();

				ObjectMapper mapper = new ObjectMapper();

				Result result = mapper.readValue(
						doc.html().split("monthlyScheduleModel: ")[1].split(",\r\n" + "		seasonList")[0],
						Result.class);

				List<Object> calendarSportList = new ArrayList<Object>();

				for (String key : result.getDailyScheduleListMap().keySet()) {

					List<SportListResult> sportList = result.getDailyScheduleListMap().get(key);

					for (SportListResult element : sportList) {
						CalendarSport cs = new CalendarSport();

						int hrs = Integer.parseInt(element.getGameStartTime().split(":")[0]);
						int min = Integer.parseInt(element.getGameStartTime().split(":")[1]);
						int year = Integer.parseInt(key.substring(0, 4));
						int mm = Integer.parseInt(key.substring(4, 6));
						int dd = Integer.parseInt(key.substring(6, 8));

						Date date = new Date(year - 1900, mm - 1, dd, hrs, min);
						long millisecond = date.getTime();

						cs.setMatchDate(millisecond);
						cs.setGameStartTime(element.getGameStartTime());
						cs.setHomeTeamName(element.getHomeTeamName());
						cs.setHomeTeamScore(element.getHomeTeamScore());
						cs.setHomeTeamEmblem64URI(element.getHomeTeamEmblem64URI());
						cs.setAwayTeamName(element.getAwayTeamName());
						cs.setAwayTeamScore(element.getAwayTeamScore());
						cs.setAwayTeamEmblem64URI(element.getAwayTeamEmblem64URI());
						cs.setLeagueTitle("MLB");
						cs.setUserCategoryNo(4);

						sqlSession.update("CalendarSportMapper.addCalendarSport", cs);

					}					
				}
			} // elseif��
		} // �� for��
	}// MLB��

	public void kBasketballData() throws Exception {
		for (int month = 10; month < 16; month++) {
			if (month < 13) {
				String address = "https://sports.news.naver.com/basketball/schedule/index.nhn?date=20190127&month="
						+ month + "&year=2018&teamCode=&category=kbl";
				System.out.println("2018�� : " + address);
				Document doc = Jsoup.connect(address).header("User-Agent", "Mozilla/5.0").get();
				Elements contents = doc.select(".sch_volleyball.tb_kbl tr");

				List<Object> sportList = new ArrayList<Object>();

				String date = "";
				int yy = 2018;
				int mm = 0;
				int dd = 0;
				int hrs = 0;
				int min = 0;
				for (Element baseball : contents) {

					CalendarSport cs = new CalendarSport();

					// date set
					if (baseball.getElementsByAttribute("rowspan").size() > 0) {
						date = baseball.select(".td_date strong").text();

					} else if (baseball.getElementsByTag("td").size() != 5
							&& baseball.getElementsByTag("td").size() != 6) {
						continue;
					}
					mm = Integer.parseInt(date.split("\\.")[0]);
					dd = Integer.parseInt(date.split("\\.")[1]);
					if (baseball.getElementsByClass("td_hour").text().equals("-")) {
						continue;
					}

					String gameStartTime = baseball.getElementsByClass("td_hour").text();
					hrs = Integer.parseInt(gameStartTime.split(":")[0]);
					min = Integer.parseInt(gameStartTime.split(":")[1]);

					Date matchDate = new Date(yy - 1900, mm - 1, dd, hrs, min);
					long millisecond = matchDate.getTime();

					// score set
					String score = baseball.getElementsByClass("td_score").text();
					if (baseball.getElementsByClass("td_score").text().equals("VS")) {
						score = "777:777";
					} else {
						score = baseball.getElementsByClass("td_score").text();
					}

					cs.setMatchDate(millisecond);
					cs.setGameStartTime(gameStartTime);
					cs.setHomeTeamName(baseball.getElementsByClass("team_lft").text());
					cs.setHomeTeamScore(Integer.parseInt(score.split(":")[0]));
					cs.setAwayTeamName(baseball.getElementsByClass("team_rgt").text());
					cs.setAwayTeamScore(Integer.parseInt(score.split(":")[1]));
					cs.setLeagueTitle("KBL");
					cs.setUserCategoryNo(5);

					sqlSession.update("CalendarSportMapper.addCalendarSport", cs);

				} // enhanced for��				
				
			} // if �� ��
			else if (12 < month && month < 16) {
				String address = "https://sports.news.naver.com/basketball/schedule/index.nhn?date=20190127&month="
						+ (month - 12) + "&year=2019&teamCode=&category=kbl";
				System.out.println("2019�� : " + address);
				Document doc = Jsoup.connect(address).header("User-Agent", "Mozilla/5.0").get();
				Elements contents = doc.select(".sch_volleyball.tb_kbl tr");

				List<Object> sportList = new ArrayList<Object>();

				String date = "";
				int yy = 2019;
				int mm = 0;
				int dd = 0;
				int hrs = 0;
				int min = 0;
				for (Element baseball : contents) {

					CalendarSport cs = new CalendarSport();

					// date set
					if (baseball.getElementsByAttribute("rowspan").size() > 0) {
						date = baseball.select(".td_date strong").text();

					} else if (baseball.getElementsByTag("td").size() != 5
							&& baseball.getElementsByTag("td").size() != 6) {
						continue;
					}
					mm = Integer.parseInt(date.split("\\.")[0]);
					dd = Integer.parseInt(date.split("\\.")[1]);
					if (baseball.getElementsByClass("td_hour").text().equals("-")) {
						continue;
					}

					String gameStartTime = baseball.getElementsByClass("td_hour").text();
					hrs = Integer.parseInt(gameStartTime.split(":")[0]);
					min = Integer.parseInt(gameStartTime.split(":")[1]);

					Date matchDate = new Date(yy - 1900, mm - 1, dd, hrs, min);
					long millisecond = matchDate.getTime();

					// score set
					String score = baseball.getElementsByClass("td_score").text();
					if (baseball.getElementsByClass("td_score").text().equals("VS")) {
						score = "777:777";
					} else {
						score = baseball.getElementsByClass("td_score").text();
					}

					cs.setMatchDate(millisecond);
					cs.setGameStartTime(gameStartTime);
					cs.setHomeTeamName(baseball.getElementsByClass("team_lft").text());
					cs.setHomeTeamScore(Integer.parseInt(score.split(":")[0]));
					cs.setAwayTeamName(baseball.getElementsByClass("team_rgt").text());
					cs.setAwayTeamScore(Integer.parseInt(score.split(":")[1]));
					cs.setLeagueTitle("KBL");
					cs.setUserCategoryNo(5);

					sqlSession.update("CalendarSportMapper.addCalendarSport", cs);

				} // enhanced for��			

			} // else if �� ��

		} // for�� ��
	}// KBL��

	public void wBasketballData() throws Exception {
		for (int month = 10; month < 17; month++) {

			if (month < 13) {
				String address = "https://sports.news.naver.com/basketball/schedule/index.nhn?date=20190127&month="
						+ month + "&year=2018&teamCode=&category=nba";
				System.out.println("2018�� : " + address);
				Document doc = Jsoup.connect(address).header("User-Agent", "Mozilla/5.0").get();
				Elements contents = doc.select(".sch_volleyball.tb_nba tr");

				List<Object> sportList = new ArrayList<Object>();

				String date = "";
				int yy = 2018;
				int mm = 0;
				int dd = 0;
				int hrs = 0;
				int min = 0;
				for (Element baseball : contents) {
					// System.out.println(baseball.text());

					CalendarSport cs = new CalendarSport();

					// date set
					if (baseball.getElementsByAttribute("rowspan").size() > 0) {
						date = baseball.select(".td_date strong").text();

					} else if (baseball.getElementsByTag("td").size() != 4
							&& baseball.getElementsByTag("td").size() != 5) {
						continue;
					}

					mm = Integer.parseInt(date.split("\\.")[0]);
					dd = Integer.parseInt(date.split("\\.")[1]);
					if (baseball.getElementsByClass("td_hour").text().equals("-")) {
						continue;
					}

					String gameStartTime = baseball.getElementsByClass("td_hour").text();
					hrs = Integer.parseInt(gameStartTime.split(":")[0]);
					min = Integer.parseInt(gameStartTime.split(":")[1]);

					Date matchDate = new Date(yy - 1900, mm - 1, dd, hrs, min);
					long millisecond = matchDate.getTime();

					// score set
					String score = baseball.getElementsByClass("td_score").text();
					if (baseball.getElementsByClass("td_score").text().equals("VS")) {
						score = "777:777";
					} else {
						score = baseball.getElementsByClass("td_score").text();
					}

					cs.setMatchDate(millisecond);
					cs.setGameStartTime(gameStartTime);
					cs.setHomeTeamName(baseball.getElementsByClass("team_lft").text());
					cs.setHomeTeamScore(Integer.parseInt(score.split(":")[0]));
					cs.setAwayTeamName(baseball.getElementsByClass("team_rgt").text());
					cs.setAwayTeamScore(Integer.parseInt(score.split(":")[1]));
					cs.setLeagueTitle("NBA");
					cs.setUserCategoryNo(6);

					sqlSession.update("CalendarSportMapper.addCalendarSport", cs);

				} // enhanced for��			
				
			} // if�� ��
			else if (12 < month && month < 17) {
				String address = "https://sports.news.naver.com/basketball/schedule/index.nhn?date=20190127&month="
						+ (month - 12) + "&year=2019&teamCode=&category=nba";
				System.out.println("2019�� : " + address);
				Document doc = Jsoup.connect(address).header("User-Agent", "Mozilla/5.0").get();
				Elements contents = doc.select(".sch_volleyball.tb_nba tr");

				List<Object> sportList = new ArrayList<Object>();

				String date = "";
				int yy = 2019;
				int mm = 0;
				int dd = 0;
				int hrs = 0;
				int min = 0;
				for (Element baseball : contents) {
					// System.out.println(baseball.text());

					CalendarSport cs = new CalendarSport();

					// date set
					if (baseball.getElementsByAttribute("rowspan").size() > 0) {
						date = baseball.select(".td_date strong").text();

					} else if (baseball.getElementsByTag("td").size() != 4
							&& baseball.getElementsByTag("td").size() != 5) {
						continue;
					}

					mm = Integer.parseInt(date.split("\\.")[0]);
					dd = Integer.parseInt(date.split("\\.")[1]);
					if (baseball.getElementsByClass("td_hour").text().equals("-")) {
						continue;
					}

					String gameStartTime = baseball.getElementsByClass("td_hour").text();
					hrs = Integer.parseInt(gameStartTime.split(":")[0]);
					min = Integer.parseInt(gameStartTime.split(":")[1]);

					Date matchDate = new Date(yy - 1900, mm - 1, dd, hrs, min);
					long millisecond = matchDate.getTime();

					// score set
					String score = baseball.getElementsByClass("td_score").text();
					if (baseball.getElementsByClass("td_score").text().equals("VS")) {
						score = "777:777";
					} else {
						score = baseball.getElementsByClass("td_score").text();
					}

					cs.setMatchDate(millisecond);
					cs.setGameStartTime(gameStartTime);
					cs.setHomeTeamName(baseball.getElementsByClass("team_lft").text());
					cs.setHomeTeamScore(Integer.parseInt(score.split(":")[0]));
					cs.setAwayTeamName(baseball.getElementsByClass("team_rgt").text());
					cs.setAwayTeamScore(Integer.parseInt(score.split(":")[1]));
					cs.setLeagueTitle("NBA");
					cs.setUserCategoryNo(6);

					sqlSession.update("CalendarSportMapper.addCalendarSport", cs);

				} // enhanced for��				
			} // else if��
		} // FOR�� ��
	}// NBA��

}

class Result {
	private String year;
	private String month;
	private Map<String, List<SportListResult>> dailyScheduleListMap;

	public Result() {
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public Map<String, List<SportListResult>> getDailyScheduleListMap() {
		return dailyScheduleListMap;
	}

	public void setDailyScheduleListMap(Map<String, List<SportListResult>> dailyScheduleListMap) {
		this.dailyScheduleListMap = dailyScheduleListMap;
	}

	@Override
	public String toString() {
		return "Result [year=" + year + ", month=" + month + ", dailyScheduleListMap=" + dailyScheduleListMap + "]";
	}

}

@JsonIgnoreProperties(ignoreUnknown = true)
class SportListResult {
	private String gameStartTime;

	private String homeTeamName;
	private String awayTeamName;

	private int homeTeamScore;
	private int awayTeamScore;

	private String homeTeamEmblem64URI;
	private String awayTeamEmblem64URI;

	private List<CalendarSport> sportList;

	public SportListResult() {

	}

	public String getHomeTeamName() {
		return homeTeamName;
	}

	public void setHomeTeamName(String homeTeamName) {
		this.homeTeamName = homeTeamName;
	}

	public String getAwayTeamName() {
		return awayTeamName;
	}

	public void setAwayTeamName(String awayTeamName) {
		this.awayTeamName = awayTeamName;
	}

	public int getHomeTeamScore() {
		return homeTeamScore;
	}

	public void setHomeTeamScore(int homeTeamScore) {
		this.homeTeamScore = homeTeamScore;
	}

	public int getAwayTeamScore() {
		return awayTeamScore;
	}

	public void setAwayTeamScore(int awayTeamScore) {
		this.awayTeamScore = awayTeamScore;
	}

	public String getHomeTeamEmblem64URI() {
		return homeTeamEmblem64URI;
	}

	public void setHomeTeamEmblem64URI(String homeTeamEmblem64URI) {
		this.homeTeamEmblem64URI = homeTeamEmblem64URI;
	}

	public String getAwayTeamEmblem64URI() {
		return awayTeamEmblem64URI;
	}

	public void setAwayTeamEmblem64URI(String awayTeamEmblem64URI) {
		this.awayTeamEmblem64URI = awayTeamEmblem64URI;
	}

	public String getGameStartTime() {
		return gameStartTime;
	}

	public void setGameStartTime(String gameStartTime) {
		this.gameStartTime = gameStartTime;
	}

	public List<CalendarSport> getSportList() {
		return sportList;
	}

	public void setSportList(List<CalendarSport> sportList) {
		this.sportList = sportList;
	}

	@Override
	public String toString() {
		return "SportListResult [gameStartTime=" + gameStartTime + ", homeTeamName=" + homeTeamName + ", awayTeamName="
				+ awayTeamName + ", homeTeamScore=" + homeTeamScore + ", awayTeamScore=" + awayTeamScore
				+ ", homeTeamEmblem64URI=" + homeTeamEmblem64URI + ", awayTeamEmblem64URI=" + awayTeamEmblem64URI + "]";
	}

}
