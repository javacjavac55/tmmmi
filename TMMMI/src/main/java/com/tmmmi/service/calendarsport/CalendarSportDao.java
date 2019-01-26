package com.tmmmi.service.calendarsport;

import java.util.List;
import java.util.Map;

import com.tmmmi.common.Search;
import com.tmmmi.service.domain.CalendarSport;
import com.tmmmi.service.domain.Schedule;

public interface CalendarSportDao {
	public List<Schedule> getCalendarSportList(Map<String, Long> map)throws Exception;

	
}