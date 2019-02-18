scrapTABLE
CREATE TABLE scrap(
	scrap_no NUMBER NOT NULL,
	user_no NUMBER NOT NULL,
	scrap_category NUMBER(1) NOT NULL,
	scrap_title VARCHAR2(4000) NOT NULL,
	scrap_detail CLOB NOT NULL,
	scrap_date DATE NOT NULL,
	read_check NUMBER(1) DEFAULT 0NOT NULL,
	scrap_delete_check NUMBER(1) DEFAULT 0,
	PRIMARY KEY(scrap_no)
);
CREATE SEQUENCE scrap_no INCREMENT BY 1 START WITH 1;
ALTER TABLE scrap ADD FOREIGN KEY(user_no) REFERENCES users(user_no);

DROP TABLE scrap;
DROP SEQUENCE scrap_no;
