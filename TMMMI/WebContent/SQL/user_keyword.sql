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

DROP TABLE user_keyword;
DROP SEQUENCE user_keyword_no;
