package com.tmmmi.service.calendarsport;

import java.util.List;
import java.util.Map;

import com.tmmmi.common.Search;
import com.tmmmi.service.domain.Schedule;

public interface CalendarSportService {
	public List<Schedule> getCalendarSportList(long startDate, long endDate) throws Exception;
}
