todo TABLE
CREATE TABLE todo (
	todo_no NUMBER NOT NULL,
	user_no NUMBER NOT NULL,
	todo_detail VARCHAR2(4000) NOT NULL,
	todo_start_date DATE NOT NULL,
	todo_end_date DATE NOT NULL,
	PRIMARY KEY(todo_no)
);

CREATE SEQUENCE todo_no INCREMENT BY 1 START WITH 1;
ALTER TABLE todo ADD FOREIGN KEY(user_no) REFERENCES users(user_no);

DROP TABLE todo;
DROP SEQUENCE todo_no;
