calendar_movieTABLE
DROP TABLE calendar_movie;
CREATE TABLE calendar_movie(
	calendar_movie_no NUMBER NOT NULL,
user_category_no NUMBER NOT NULL,
calendar_movie_code VARCHAR2(4000) NOT NULL,
calendar_movie_title VARCHAR2(4000) NOT NULL,
calendar_movie_title_eng VARCHAR2(4000),
calendar_movie_open_date NUMBER NOT NULL,
	PRIMARY KEY(calendar_movie_no)
);

DROP SEQUENCEcalendar_movie_no;
CREATE SEQUENCE calendar_movie_no INCREMENT BY 1 START WITH 1;

<insert id="addCalendarMovie" parameterType="java.util.List" useGeneratedKeys="true">
		<selectKeyresultType="java.lang.Integer" keyProperty="calendar_movie_no" order="BEFORE">
			SELECT calendar_movie_no.nextval as calendar_movie_no FROM DUAL
		</selectKey>
		INSERT INTO calendar_movie
		( calendar_movie_no , user_category_no, calendar_movie_code , calendar_movie_title , 	calendar_movie_title_eng , 	calendar_movie_open_date )
            SELECT calendar_movie_no.nextval, a.* FROM (
		<foreach collection="list" item="movie" index="index" separator="UNION ALL">
			SELECT 
			0 as user_category_no,
			#{movie.movieCd} as calendar_movie_code,
			#{movie.movieNm} as calendar_movie_title,
			#{movie.movieNmEn:VARCHAR} as calendar_movie_title_eng,
			#{movie.openDt} as calendar_movie_open_date
            FROM DUAL
		</foreach> ) a
</insert>

