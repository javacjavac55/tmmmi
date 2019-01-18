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

@Repository("CalendarSportDaoImpl")
public class CalendarSportDaoImpl implements CalendarSportDao {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession	 = sqlSession;
	}
	
	public CalendarSportDaoImpl() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
		
	}

	
	@Override
	public List<CalendarSport> getCalendarSportList(Search search, int userNo) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map= new HashMap<String, Object>();
		map.put("search", search);
		map.put("userNo", userNo);
		
		return sqlSession.selectList("CalendarSportMapper.getCalendarSportList", map);
	}

}
