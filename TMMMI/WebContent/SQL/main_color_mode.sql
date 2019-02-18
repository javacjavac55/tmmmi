main_color_mode TABLE
CREATE TABLE main_color_mode(
	main_color_mode_no NUMBER(1) NOT NULL,
	main_background_color VARCHAR2(7) NOT NULL,
	main_font_color VARCHAR2(7) NOT NULL,
	PRIMARY KEY(main_color_mode_no)
);

CREATE SEQUENCE main_color_mode_no INCREMENT BY 1 START WITH 1;

DROP TABLE main_color_mode;
DROP SEQUENCE main_color_mode_no;

