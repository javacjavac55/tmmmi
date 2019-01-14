package com.tmmmi.service.schedule.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.tmmmi.service.domain.Schedule;
import com.tmmmi.service.schedule.ScheduleDao;
import com.tmmmi.service.schedule.ScheduleService;
import com.tmmmi.service.usercategory.UserCategoryDao;

@Service("scheduleServiceImpl")
public class ScheduleServiceImpl implements ScheduleService {
	
	@Autowired
	@Qualifier("scheduleDaoImpl")
	ScheduleDao scheduleDao;
	public void setScheduleDao(ScheduleDao scheduleDao) {
		this.scheduleDao = scheduleDao;
	}
	
	public ScheduleServiceImpl() {
		
	}

	@Override
	public int addSchedule(Schedule schedule) {
		return scheduleDao.addSchedule(schedule);
	}

	@Override
	public void getScheduleList() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int updateSchedule(Schedule schedule) {
		return scheduleDao.updateSchedule(schedule);
	}

	@Override
	public int deleteSchedule(Schedule schedule) {
		return scheduleDao.deleteSchedule(schedule);
	}

	@Override
	public void getFrequentScheduleList() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void getImportantScheduleList() {
		// TODO Auto-generated method stub
		
	}

}
