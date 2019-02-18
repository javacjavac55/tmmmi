users TABLE
CREATE TABLE users(
	user_no NUMBER NOT NULL,
	user_id VARCHAR2(10) NOT NULL,
	password VARCHAR2(10),
	email VARCHAR2(30) NOT NULL,
	email_check NUMBER DEFAULT 0,
	user_name VARCHAR2(30),
	birthday DATE,
	refresh_token VARCHAR2(50),
	refresh_token_expire_time VARCHAR2(50),
	sns_name NUMBER,
	role NUMBER DEFAULT 1,
	withdraw_check NUMBER DEFAULT 0,
	withdraw_date DATE,
	PRIMARY KEY(user_no)
);
CREATE SEQUENCE user_no INCREMENT BY 1 START WITH 1;

DROP TABLE users;
DROP SEQUENCE user_no;