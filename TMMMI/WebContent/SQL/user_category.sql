user_category TABLE
CREATE TABLE user_category(
	user_category_no NUMBER NOT NULL,
	user_no NUMBER NOT NULL,
	user_category_color VARCHAR2(7) NOT NULL,
	user_category_name VARCHAR2(4000) NOT NULL,
	PRIMARY KEY(user_category_no)
);
CREATE SEQUENCE user_category_noINCREMENT BY 1 START WITH 1;
ALTER TABLE user_category ADD FOREIGN KEY(user_no) REFERENCES users(user_no);

INSERT INTO user_category
(user_category_no, user_no, user_category_color, user_category_name)
VALUES (7, 101, '#81a8ee', '¿µÈ­ °³ºÀ ÀÏÁ¤');

INSERT INTO user_category
(user_category_no, user_no, user_category_color, user_category_name)
VALUES (1, 101, '#F04C2F', 'k¸®±×');
INSERT INTO user_category
(user_category_no, user_no, user_category_color, user_category_name)
VALUES (2, 101, '#FA4424', 'EPL');

INSERT INTO user_category
(user_category_no, user_no, user_category_color, user_category_name)
VALUES (3, 101, '#B2D95F', 'KBO');

INSERT INTO user_category
(user_category_no, user_no, user_category_color, user_category_name)
VALUES (4, 101, '#AEA21D', 'MLB');

INSERT INTO user_category
(user_category_no, user_no, user_category_color, user_category_name)
VALUES (5, 101, '#F78616', 'KBL');

INSERT INTO user_category
(user_category_no, user_no, user_category_color, user_category_name)
VALUES (6, 101, '#BE4107', 'NBA');

INSERT INTO user_category
( user_category_no, user_no, user_category_color, user_category_name )
VALUES (8, 6, '#a2cdf6', '¿¬ÇÏ´Ã');

INSERT INTO user_category
( user_category_no, user_no, user_category_color, user_category_name )
VALUES (9, 6, '#e6c4f8', '¿¬º¸¶ó');

INSERT INTO user_category
( user_category_no, user_no, user_category_color, user_category_name )
VALUES (10, 6, '#efa3a3', '³È³È');

INSERT INTO user_category
( user_category_no, user_no, user_category_color, user_category_name )
VALUES (11, 6, '#eed17c', 'ÄðÄð');

INSERT INTO user_category
( user_category_no, user_no, user_category_color, user_category_name )
VALUES (12, 6, '#b4ef8f', 'ÃÊ·ÏÃÊ·Ï');

INSERT INTO user_category
( user_category_no, user_no, user_category_color, user_category_name )
VALUES (13, 6, '#a3dee0', 'ÆÄ¶ûÆÄ¶û');

DROP TABLE user_category;
DROP SEQUENCE user_category_no;