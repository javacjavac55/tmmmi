qna TABLE
CREATE TABLE qna(
	qna_no NUMBER NOT NULL,
	user_no NUMBER NOT NULL,
	user_center_category NUMBER(1) NOT NULL,
	qna_title VARCHAR2(100) NOT NULL,
	qna_detail VARCHAR2(4000) NOT NULL,
	qna_date DATE NOT NULL,
	qna_answer_check NUMBER(1) DEFAULT 0,
	qna_answer_detail VARCHAR2(4000),
	qna_answer_date DATE,
	PRIMARY KEY(qna_no)
);
CREATE SEQUENCE qna_no INCREMENT BY 1 START WITH 1;
ALTER TABLE qna  ADD FOREIGN KEY(user_no) REFERENCES users(user_no);

DROP TABLE qna;
DROP SEQUENCE qna_no;