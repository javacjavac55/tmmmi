package com.tmmmi.service.calendarmovie.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.tmmmi.service.calendarmovie.CalendarMovieDao;
import com.tmmmi.service.domain.Schedule;

@Repository("calendarMovieDaoImpl")
public class CalendarMovieDaoImpl implements CalendarMovieDao {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public CalendarMovieDaoImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public List<Schedule> getCalendarMovieList(Map<String, Long> map) {
		return sqlSession.selectList("CalendarMovieMapper.getCalendarMovieList", map);
	}
	
}

