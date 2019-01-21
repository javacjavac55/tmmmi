package com.tmmmi.service.calendarmovie;

import java.util.List;
import java.util.Map;

import com.tmmmi.service.domain.Schedule;

public interface CalendarMovieDao {
	public List<Schedule> getCalendarMovieList(Map<String, Long> map);
}
