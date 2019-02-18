package com.tmmmi.service.calendarsport.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.tmmmi.service.calendarsport.CalendarSportDao;
import com.tmmmi.service.calendarsport.CalendarSportService;
import com.tmmmi.service.domain.Schedule;

@Service("calendarSportServiceImpl")
public class CalendarSportServiceImpl implements CalendarSportService {
	
	@Autowired
	@Qualifier("calendarSportDaoImpl")	
	private CalendarSportDao calendarSportDao;	
	public void setCalendarSportDao(CalendarSportDao calendarSportDao) {
		this.calendarSportDao = calendarSportDao;
	}
	public CalendarSportServiceImpl() {
		// TODO Auto-generated constructor stub
	}
	@Override
	public List<Schedule> getCalendarSportList(long startDate, long endDate) throws Exception{
		Map<String, Long> map = new HashMap<String, Long>();
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		
		return calendarSportDao.getCalendarSportList(map);
	}

}
