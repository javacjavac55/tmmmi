todo_complete TABLE
CREATE TABLE todo_complete (
	todo_complete_no NUMBER NOT NULL,
	todo_no NUMBER NOT NULL,
	todo_complete_date DATE NOT NULL,
	PRIMARY KEY(todo_complete_no)
);
CREATE SEQUENCE todo_complete_no INCREMENT BY 1 START WITH 1;
ALTER TABLE todo_complete ADD FOREIGN KEY(todo_no) REFERENCES todo(todo_no);

DROP TABLE todo_complete;
DROP SEQUENCE todo_complete_no;
