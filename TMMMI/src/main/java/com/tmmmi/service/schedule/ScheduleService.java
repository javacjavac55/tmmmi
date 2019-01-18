package com.tmmmi.service.schedule;

import java.sql.Date;
import java.util.List;

import com.tmmmi.service.domain.Schedule;

public interface ScheduleService {
	public int addSchedule(Schedule schedule);
	public List<Schedule> getScheduleList(int userNo, long startDate, long endDate);
	public int updateSchedule(Schedule schedule);
	public int deleteSchedule(Schedule schedule);
	public void getFrequentScheduleList();
	public void getImportantScheduleList();
}
