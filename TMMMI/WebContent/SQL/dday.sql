dday TABLE
CREATE TABLE dday (
	dday_no NUMBER NOT NULL,
	user_no NUMBER NOT NULL,
	dday_title VARCHAR2(4000) NOT NULL,
	dday_date DATE NOT NULL,
	show_dday_plus NUMBER(1) NOT NULL,
	show_dday_minus NUMBER(1) NOT NULL,
	dday_delete_check NUMBER(1) NOT NULL,
	PRIMARY KEY(dday_no)
);

CREATE SEQUENCE dday_no INCREMENT BY 1 START WITH 1;

ALTER TABLE dday ADD FOREIGN KEY(user_no) REFERENCES users(user_no);

DROP TABLE dday;
DROP SEQUENCE dday;

