package com.tmmmi.service.schedule;

import com.tmmmi.service.domain.Schedule;

public interface ScheduleDao {
	public int addSchedule(Schedule schedule);
	public void getScheduleList();
	public int updateSchedule(Schedule schedule);
	public int deleteSchedule(Schedule schedule);
	public void getFrequentScheduleList();
	public void getImportantScheduleList();
}
