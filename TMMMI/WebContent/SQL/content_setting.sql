content_setting TABLE
CREATE TABLE content_setting(
	content_setting_no NUMBER NOT NULL,
	user_no NUMBER NOT NULL,
	tasty_keyword VARCHAR2(4000),
	shopping_keyword_no NUMBER NOT NULL,
	user_keyword_no NUMBER NOT NULL,
	sort_section_no NUMBER NOT NULL,
	PRIMARY KEY(content_setting_no)
);
shopping_keyword TABLE
CREATE TABLE shopping_keyword(
	shopping_keyword_no NUMBER NOT NULL,
	shopping_search_1 VARCHAR2(30),
	shopping_search_2 VARCHAR2(30),
	shopping_search_3 VARCHAR2(30),
	shopping_review VARCHAR2(30),
	PRIMARY KEY(shopping_keyword_no)
);
user_keyword TABLE
CREATE TABLE user_keyword(
	user_keyword_no NUMBER NOT NULL,
	user_search_1 VARCHAR2(4000),
	user_search_2 VARCHAR2(4000),
user_search_3 VARCHAR2(4000),
user_video_1 VARCHAR2(4000),
user_video_2 VARCHAR2(4000),
	PRIMARY KEY(user_keyword_no)
);
sort_section TABLE
CREATE TABLE sort_section(
	sort_section_no NUMBER NOT NULL,
	show_movie_boxoffice NUMBER(2) DEFAULT 1,
	show_movie_new NUMBER(2) DEFAULT 2,
	show_movie_upcoming NUMBER(2) DEFAULT 3,
	show_movie_review NUMBER(2) DEFAULT 4,
	show_movie_trailer NUMBER(2) DEFAULT 5,
	show_soccer NUMBER(2) DEFAULT 6,
	show_oversea_soccer NUMBER(2) DEFAULT 7,
	show_baseball NUMBER(2) DEFAULT 8,
	show_oversea_baseball NUMBER(2) DEFAULT 9,
	show_basketball NUMBER(2) DEFAULT 10,
	show_sport_general NUMBER(2) DEFAULT 11,
	show_sport_highlight NUMBER(2) DEFAULT 12,
	show_tasty_keyword NUMBER(2) DEFAULT 13,
	show_shopping_search_1 NUMBER(2) DEFAULT 14,
	show_shopping_search_2 NUMBER(2) DEFAULT 15,
	show_shopping_search_3 NUMBER(2) DEFAULT 16,
	show_shopping_review NUMBER(2) DEFAULT 17,
	show_user_search_1 NUMBER(2) DEFAULT 18,
	show_user_search_2 NUMBER(2) DEFAULT 19,
	show_user_search_3 NUMBER(2) DEFAULT 20,
	show_user_video_1 NUMBER(2) DEFAULT 21,
	show_user_video_2 NUMBER(2) DEFAULT 22,
	PRIMARY KEY(sort_section_no)
);

CREATE SEQUENCE content_setting_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE shopping_keyword_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE user_keyword_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE sort_section_noINCREMENT BY 1 START WITH 1;

ALTER TABLE content_setting ADD FOREIGN KEY(user_no) REFERENCES users(user_no);
ALTER TABLE content_setting ADD CONSTRAINT uk_content_setting UNIQUE(shopping_keyword_no);
ALTER TABLE content_setting ADD CONSTRAINT uk_content_setting2 UNIQUE(user_keyword_no);
ALTER TABLE content_setting ADD CONSTRAINT uk_content_setting3 UNIQUE(sort_section_no);

DROP TABLE content_setting;
DROP SEQUENCE content_setting_no;

DROP TABLE shopping_keyword;
DROP SEQUENCE shopping_keyword_no;

DROP TABLE user_keyword;
DROP SEQUENCE user_keyword_no;

DROP TABLE sort_section;
DROP SEQUENCE sort_section_no;
