package com.tmmmi.service.calendarsport.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.tmmmi.common.Search;
import com.tmmmi.service.calendarsport.CalendarSportDao;
import com.tmmmi.service.calendarsport.CalendarSportService;
import com.tmmmi.service.diary.DiaryDao;
import com.tmmmi.service.domain.CalendarSport;

@Service("calendarSportServiceImpl")
public class CalendarSportServiceImpl implements CalendarSportService {
	
	@Autowired
	@Qualifier("calendarSportDaoImpl")	
	private CalendarSportDao calendarSportDao;
	
	public CalendarSportServiceImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public Map<String, Object> getCalendarSportList(Search search, int userNo) throws Exception {
		// TODO Auto-generated method stub
		List<CalendarSport> list = calendarSportDao.getCalendarSportList(search, userNo);
		
		return null;
	}

}
