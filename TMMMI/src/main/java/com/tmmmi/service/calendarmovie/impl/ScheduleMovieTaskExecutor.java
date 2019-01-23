package com.tmmmi.service.calendarmovie.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
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

@Configuration
@EnableScheduling
public class ScheduleMovieTaskExecutor {
	@Autowired
	@Qualifier("sqlSessionTemplateBatch")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Scheduled(cron="0 0 9 * * ?")
	//@Scheduled(cron="0 */27 * ? * *")
	public void recordMovieOpenDate(/*List<CalendarMovie> calendarMovieList*/) {
		System.out.println("start record movie open date");
		String key = "8a2950d63f7db056cb2150a0a19bc7bd";
		ObjectMapper mapper = new ObjectMapper();
		KobisOpenAPIRestService service = new KobisOpenAPIRestService(key);
		int totalPages = 0;
		int currentPage = 1;
		int searchYear = 2018;
				
		try {
			long today = 0;
			
			String initialResult = service.getMovieList(true, currentPage+"", "100", null, null, searchYear+"", (searchYear+1)+"", (searchYear-5)+"", (searchYear+1)+"", null, null);
			Result result = mapper.readValue(initialResult, Result.class);
			System.out.println("totalCount: "+ result.getMovieListResult().getTotCnt());
			totalPages = (result.getMovieListResult().getTotCnt()/100)+1;
			System.out.println("totalPages: "+ totalPages);
			
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			today = Long.parseLong(sdf.format(date));
			do {
				System.out.println("currentPage: " + currentPage);
				currentPage+=1;
				for (CalendarMovie movie: result.getMovieListResult().getMovieList()) {
					if (today<movie.getOpenDt() && !service.getMovieInfo(true, movie.getMovieCd()).contains("청소년관람불가")) {
						System.out.println(movie.getMovieCd() + " " + movie.getMovieNm());
						date = sdf.parse(movie.getOpenDt()+"");
						movie.setOpenDt(date.getTime());
						sqlSession.update("CalendarMovieMapper.addCalendarMovie", movie);
					}
				}
				initialResult = service.getMovieList(true, currentPage+"", "100", null, null, searchYear+"", (searchYear+1)+"", (searchYear-5)+"", (searchYear+1)+"", null, null);
				result = mapper.readValue(initialResult, Result.class);
			} while (currentPage<=totalPages);
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