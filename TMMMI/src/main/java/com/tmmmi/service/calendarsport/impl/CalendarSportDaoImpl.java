package com.tmmmi.service.calendarsport.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.tmmmi.common.Search;
import com.tmmmi.service.calendarsport.CalendarSportDao;
import com.tmmmi.service.domain.CalendarSport;
import com.tmmmi.service.domain.Schedule;

@Repository("calendarSportDaoImpl")
public class CalendarSportDaoImpl implements CalendarSportDao {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession	 = sqlSession;
	}
	
	public CalendarSportDaoImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public List<Schedule> getCalendarSportList(Map<String, Long> map) throws Exception{
		List<Schedule> result = sqlSession.selectList("CalendarSportMapper.getCalendarSportList", map);
		for (Schedule s:result) {
			if (s.getScheduleTitle().contains("777:777")) {
				s.setScheduleTitle(s.getScheduleTitle().replaceAll("777:777", "VS"));
			}
			
			if (s.getScheduleStartDate() > System.currentTimeMillis()) {
				s.setScheduleTitle(s.getScheduleTitle().replaceAll("0:0", "VS"));
			}
		}
		return result;
	}

}
