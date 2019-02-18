diary TABLE
CREATE TABLE diary(
	diary_no NUMBER NOT NULL,
	user_no NUMBER NOT NULL,
	user_category_no NUMBER,
	diary_title VARCHAR2(4000) NOT NULL,
	diary_detail CLOB NOT NULL,
	diary_date DATE NOT NULL,
	user_category_name VARCHAR2(100),
	diary_delete_check NUMBER(1) DEFAULT 0,
	PRIMARY KEY(diary_no)
);
CREATE SEQUENCE diary_no INCREMENT BY 1 START WITH 1;
ALTER TABLE diary  ADD FOREIGN KEY(user_no) REFERENCES users(user_no);

DROP TABLE diary;
DROP SEQUENCE diary_no;