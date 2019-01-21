package com.tmmmi.service.calendarmovie.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.codehaus.jackson.annotate.JsonProperty;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

import com.tmmmi.service.domain.CalendarMovie;

import kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService;

//@Configuration
//@EnableScheduling
public class ScheduleMovieTaskExecutor {
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//@Scheduled(cron="0 0 9 * * ?")
	//@Scheduled(cron="0 * * ? * *")
	public void recordMovieOpenDate(/*List<CalendarMovie> calendarMovieList*/) {
		System.out.println("hello");
		String key = "282479c86fdb72b4b67b66e06b045e0f";
		ObjectMapper mapper = new ObjectMapper();
		KobisOpenAPIRestService service = new KobisOpenAPIRestService(key);
		
		try {
			String initialResult = service.getMovieList(true, "1", "100", null, null, "2019", "2019", "2016", "2019", null, null);
			Result result = mapper.readValue(initialResult, Result.class);
			Date date = null;
			String pattern = "yyyyMMdd";
			for (CalendarMovie movie: result.getMovieListResult().getMovieList()) {
				date = new SimpleDateFormat(pattern).parse(movie.getOpenDt()+"");
				movie.setOpenDt(date.getTime());
				System.out.println(movie.getOpenDt());
				sqlSession.insert("CalendarMovieMapper.addCalendarMovie", movie);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}

class Result {
	@JsonProperty("movieListResult")
	private MovieListResult movieListResult;
	
	public Result() {
		
	}
	
	public MovieListResult getMovieListResult() {
		return movieListResult;
	}
	
	public void setMovieListResult(MovieListResult movieListResult) {
		this.movieListResult = movieListResult;
	}
}

class MovieListResult {
	private int totCnt;
	private String source;
	@JsonProperty("movieList")
	private List<CalendarMovie> movieList;
	
	public MovieListResult() {
		
	}
	
	public int getTotCnt() {
		return totCnt;
	}
	
	public void setTotCnt(int totCnt) {
		this.totCnt = totCnt;
	}
	
	public String getSource() {
		return source;
	}
	
	public void setSource(String source) {
		this.source = source;
	}
	
	public List<CalendarMovie> getMovieList() {
		return movieList;
	}
	
	public void setMovieList(List<CalendarMovie> movieList) {
		this.movieList = movieList;
	}

}