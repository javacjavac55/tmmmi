package com.tmmmi.service.schedule.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.tmmmi.service.domain.DDay;
import com.tmmmi.service.domain.Schedule;
import com.tmmmi.service.schedule.ScheduleDao;

@Repository("scheduleDaoImpl")
public class ScheduleDaoImpl implements ScheduleDao {
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public ScheduleDaoImpl() {
		
	}

	@Override
	public int addSchedule(Schedule schedule) {
		return sqlSession.insert("ScheduleMapper.addSchedule", schedule);
	}

	@Override
	public List<Schedule> getScheduleList(Map<String,Object> map) {
		return sqlSession.selectList("ScheduleMapper.getScheduleList", map);
	}

	@Override
	public int updateSchedule(Schedule schedule) {
		return sqlSession.update("ScheduleMapper.updateSchedule", schedule);
		
	}

	@Override
	public int deleteSchedule(Schedule schedule) {
		return sqlSession.delete("ScheduleMapper.deleteSchedule", schedule);
		
	}

	@Override
	public List<DDay> getDDayScheduleList(Map<String,Object> map) {
		List<DDay> result = sqlSession.selectList("ScheduleMapper.getDDayScheduleList", map);
		
		for (DDay dDay:result) {
			dDay.setTargetDateStart((long)map.get("startDate"));
			if (dDay.getMarkDDay().equals("0")) {
				dDay.setMarkDDay("D-");
			} else {
				dDay.setMarkDDay("D+");
			}
			dDay.setCount(Math.abs(Math.toIntExact((dDay.getdDayStart()-(long)map.get("startDate"))/86400000)));
		}
		return result;
	}

	@Override
	public List<Schedule> getImportantScheduleList(Map<String,Object> map) {
		return sqlSession.selectList("ScheduleMapper.getImportantScheduleList", map);
	}

}
