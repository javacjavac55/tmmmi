package com.tmmmi.service.calendarsport;

import java.util.List;

import com.tmmmi.service.domain.Schedule;

public interface CalendarSportService {
	public List<Schedule> getCalendarSportList(long startDate, long endDate) throws Exception;
}
