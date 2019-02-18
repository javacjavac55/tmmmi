package com.tmmmi.service.calendarmovie.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.tmmmi.service.calendarmovie.CalendarMovieDao;
import com.tmmmi.service.calendarmovie.CalendarMovieService;
import com.tmmmi.service.domain.Schedule;

@Service("calendarMovieServiceImpl")
public class CalendarMovieServiceImpl implements CalendarMovieService {
	
	@Autowired
	@Qualifier("calendarMovieDaoImpl")
	private CalendarMovieDao calendarMovieDao;
	public void setCalendarMovieDao(CalendarMovieDao calendarMovieDao) {
		this.calendarMovieDao = calendarMovieDao;
	}
	
	public CalendarMovieServiceImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public List<Schedule> getCalendarMovieList(long startDate, long endDate) {
		Map<String, Long> map = new HashMap<String, Long>();
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		return calendarMovieDao.getCalendarMovieList(map);
	}

}
