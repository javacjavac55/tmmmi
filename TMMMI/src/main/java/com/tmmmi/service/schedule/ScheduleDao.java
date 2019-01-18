package com.tmmmi.service.schedule;

import java.util.List;
import java.util.Map;

import com.tmmmi.service.domain.Schedule;

public interface ScheduleDao {
	public int addSchedule(Schedule schedule);
	public List<Schedule> getScheduleList(Map<String,Object> map);
	public int updateSchedule(Schedule schedule);
	public int deleteSchedule(Schedule schedule);
	public void getFrequentScheduleList();
	public void getImportantScheduleList();
}
