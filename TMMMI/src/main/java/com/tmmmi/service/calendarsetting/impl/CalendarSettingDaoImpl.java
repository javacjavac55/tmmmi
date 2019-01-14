package com.tmmmi.service.calendarsetting.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.tmmmi.service.calendarsetting.CalendarSettingDao;
import com.tmmmi.service.domain.CalendarSetting;

@Repository("calendarSettingDaoImpl")
public class CalendarSettingDaoImpl implements CalendarSettingDao {
	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	///Constructor
	public CalendarSettingDaoImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addCalendarSetting(CalendarSetting calendarSetting) {
		sqlSession.insert("CalendarSettingMapper.addCalendarSetting", calendarSetting);
	}

	@Override
	public CalendarSetting getCalendarSetting(int userNo) {
		return sqlSession.selectOne("CalendarSettingMapper.getCalendarSetting", userNo);
	}

	@Override
	public void updateCalendarSetting(CalendarSetting calendarSetting) {
		sqlSession.update("CalendarSettingMapper.updateCalendarSetting", calendarSetting);
	}

}
