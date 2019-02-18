calendar_sportTABLE
CREATE TABLE calendar_sport(
	calendar_sport_no NUMBER NOT NULL,
user_category_no NUMBER NOT NULL,
	calendar_sport_date NUMBER NOT NULL,
	calendar_sport_time VARCHAR2(300) NOT NULL,
	league_name VARCHAR2(4000) NOT NULL,
	team_home_name VARCHAR2(4000) NOT NULL,
	team_away_name VARCHAR2(4000) NOT NULL,
	team_home_score NUMBER(3),
	team_away_score NUMBER(3),
	team_home_emblem VARCHAR2(4000),
	team_away_emblem VARCHAR2(4000),
	calendar_sport_link VARCHAR2(4000),
	PRIMARY KEY(calendar_sport_no)
);
DROP TABLE calendar_sport;
CREATE SEQUENCE calendar_sport_no INCREMENT BY 1 START WITH 1;
DROP SEQUENCE calendar_sport_no;
