package com.tmmmi.service.calendarsport;

import java.util.Map;

import com.tmmmi.common.Search;

public interface CalendarSportService {
	public Map<String, Object> getCalendarSportList(Search search, int userNo) throws Exception;
}
