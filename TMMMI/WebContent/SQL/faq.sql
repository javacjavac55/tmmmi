faq TABLE
CREATE TABLE faq(
	faq_no NUMBER NOT NULL,
	user_center_category NUMBER(1) NOT NULL,
	faq_title VARCHAR2(100) NOT NULL,
	faq_detail VARCHAR2(4000) NOT NULL,	
	faq_date DATE NOT NULL,
	faq_delete_check NUMBER(1) DEFAULT 1,
	PRIMARY KEY(faq_no)
);

CREATE SEQUENCE faq_no INCREMENT BY 1 START WITH 1;
ALTER TABLE faq  ADD FOREIGN KEY(user_no) REFERENCES users(user_no);

DROP TABLE faq;
DROP SEQUENCE faq_no;
