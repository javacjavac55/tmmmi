package com.tmmmi.service.calendarsport;

import java.util.List;

import com.tmmmi.common.Search;
import com.tmmmi.service.domain.CalendarSport;

public interface CalendarSportDao {
	public List<CalendarSport> getCalendarSportList(Search search, int userNo)throws Exception;
}