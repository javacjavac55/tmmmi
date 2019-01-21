package com.tmmmi.service.calendarmovie;

import java.util.List;

import com.tmmmi.service.domain.Schedule;

public interface CalendarMovieService {
	public List<Schedule> getCalendarMovieList(long startDate, long endDate);
}
