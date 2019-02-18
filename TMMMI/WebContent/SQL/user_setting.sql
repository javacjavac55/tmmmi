user_setting TABLE
CREATE TABLE user_setting(
	user_setting_no NUMBER NOT NULL,
	user_no NUMBERUNIQUE,
	main_color_mode_no NUMBER(1) DEFAULT 0,
	menu_background_color VARCHAR2(7) DEFAULT ¡®#E8F5FF¡¯,
	menu_font_color VARCHAR2(7) DEFAULT ¡®#000000¡¯,
	show_scrap_alarmNUMBER(1) DEFAULT 0,
	scrap_alarm_time VARCHAR2(4),
	image varchar2(100),
	PRIMARY KEY(user_setting_no)
);
CREATE SEQUENCE user_setting_no INCREMENT BY 1 START WITH 1;
ALTER TABLE user_setting ADD FOREIGN KEY(user_no) REFERENCES users(user_no);

DROP TABLE user_setting;
DROP SEQUENCE user_setting_no;

