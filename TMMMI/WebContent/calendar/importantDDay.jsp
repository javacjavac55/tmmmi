<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
</head>
<body>
			<span class="important dropdown">
            	<button id="dropdownMenu-important" type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown"
                    aria-haspopup="true" aria-expanded="true">
                    <span id="">ø¿¥√¿« ¡ﬂø‰«— ¿œ¡§</span>&nbsp;
                    <i class="calendar-icon tui-full-calendar-dropdown-arrow"></i>
                </button>
                <ul id="imp-sch-container" class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu-important">
                </ul>
            </span>
            <span class="dday dropdown">
            	<button id="dropdownMenu-dday" type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown"
                    aria-haspopup="true" aria-expanded="true">
                    <span id="">ø¿¥√¿« ±‚≥‰¿œ</span>&nbsp;
                    <i class="calendar-icon tui-full-calendar-dropdown-arrow"></i>
                </button>
                <ul id="dday-container" class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu-dday">
                </ul>
            </span>
</body>
<script src="/javascript/tui/data/schedules.js" charset="utf-8"></script>
<script>
	var schedule;
	var importantList=[];
	
	function fncAdjustScheduleValues(schedule){
		schedule.isAllday = (schedule.isAllday!=0)?true:false;
		schedule.isPending = (schedule.isPending!=0)?true:false;
		schedule.state = (schedule.state!=0)?'D+Day':'D-Day';
		if (schedule.category!=0) {
			schedule.category = /* 'milestone' */'time';
		} else if (schedule.isAllday) {
			schedule.category = 'allday';
			
		} else {
			schedule.category = 'time';
		} 
		if(schedule.recurrenceRule == 0){
			schedule.recurrenceRule = '';
		}
		schedule.start = new Date(schedule.start*=1);
		schedule.end = new Date(schedule.end*=1); 
		return schedule;
	}
	
	<c:forEach var="schedule" items="${importantScheduleList}">
		console.log(schedule);
		schedule = new ScheduleInfo();
		schedule.id = "${schedule.scheduleNo}";
		schedule.calendarId = "${schedule.userCategoryNo}";
		schedule.bgColor = "${schedule.userCategoryColor}";
		schedule.title = "${schedule.scheduleTitle}";
		schedule.body = "${schedule.scheduleDetail}";
		schedule.location = "${schedule.scheduleLocation}";
		schedule.start = "${schedule.scheduleStartDate}";
		schedule.end = "${schedule.scheduleEndDate}";
		schedule.goingDuration = "${schedule.goingDuration}";
		schedule.comingDuration = "${schedule.comingDuration}";
		schedule.isAllday = "${schedule.isScheduleDDay}";
		schedule.state = "${schedule.markDDay}";
		schedule.isPending = "${schedule.isScheduleImportant}";
		schedule.recurrenceRule = "${schedule.scheduleAlarmTime}";
		schedule = fncAdjustScheduleValues(schedule);
		importantList.push(schedule);
	</c:forEach>
	
	for(var i=0; i<importantList.length; i++) {
		console.log(importantList[i]);
		$('#imp-sch-container').append('<li role="presentation"><a class="dropdown-menu-title schedule" role="menuitem" style="background-color:'
				+importantList[i].bgColor+'; border-color:'
				+importantList[i].bgColor+'"><span class="time">'
				+importantList[i].start.toString().split(" ")[4].substring(0, 5)+'</span><span class="title">'
				+importantList[i].title+'</span></a></li>')		
	}
	
	/* var dDayList=[]; */
	<c:forEach var="dday" items="${dDayScheduleList}">
		console.log('${dday}');
		$('#dday-container').append('<li role="presentation"><a class="dropdown-menu-title schedule" role="menuitem" style="background-color:'
				+'${dday.userCategoryColor}'+'; border-color:'
				+'${dday.userCategoryColor}'+'"><span class="time">'
				+'${dday.markDDay}'+'${dday.count}'+'</span><span class="title">'
				+'${dday.dDayTitle}'+'</span></a></li>')
	</c:forEach>
</script>
</html>