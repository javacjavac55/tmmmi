schedule TABLE
CREATE TABLE schedule(
	schedule_no NUMBER NOT NULL,
	user_no NUMBER NOT NULL,
	user_category_no NUMBER,
	schedule_title VARCHAR2(4000) NOT NULL,
	schedule_detail VARCHAR2(4000),
	schedule_location VARCHAR2(4000),
	schedule_start_date NUMBER NOT NULL,
	schedule_end_date NUMBER NOT NULL,
	going_duration NUMBER,
	coming_duration NUMBER,
	schedule_dday NUMBER(1) DEFAULT 0,
	mark_dday NUMBER(1)DEFAULT 0,
	schedule_important NUMBER(1) DEFAULT 0,
	schedule_alarm_time NUMBER,
	schedule_delete_check NUMBER(1) DEFAULT 0,
	PRIMARY KEY(schedule_no)
);
CREATE SEQUENCE schedule_no INCREMENT BY 1 START WITH 1;
ALTER TABLE schedule ADD FOREIGN KEY(user_no) REFERENCES users(user_no);
ALTER TABLE schedule ADD FOREIGN KEY(user_category_no) REFERENCES user_category(user_category_no);

DROP TABLE schedule;
DROP SEQUENCE schedule_no;
