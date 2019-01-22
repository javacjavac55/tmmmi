<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <title>Calendar DEMO</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="https://uicdn.toast.com/tui.time-picker/latest/tui-time-picker.css">
    <link rel="stylesheet" type="text/css" href="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.css">
    <link rel="stylesheet" type="text/css" href="/css/tui/tui-calendar.css" />
    <link rel="stylesheet" type="text/css" href="/css/tui/default.css"></link>
    <link rel="stylesheet" type="text/css" href="/css/tui/icons.css"></link>
</head>
<body>
    <div id="top">
        TMMMI
    </div>
    <div id="lnb">
        <div class="lnb-new-schedule">
            <button id="btn-new-schedule" type="button" class="btn btn-default btn-block lnb-new-schedule-btn" data-toggle="modal">
                	일정 등록</button>
        </div>
        <div id="lnb-calendars" class="lnb-calendars">
            <div>
                <div class="lnb-calendars-item">
                    <label>
                        <input class="tui-full-calendar-checkbox-square" type="checkbox" value="all" checked>
                        <span></span>
                        <strong>모두 보기</strong>
                    </label>
                </div>
            </div>
            <div id="calendarList" class="lnb-calendars-d1">
            </div>
        </div>
    </div>
    <div id="right">
        <div id="menu">
            <span class="dropdown">
                <button id="dropdownMenu-calendarType" class="btn btn-default btn-sm dropdown-toggle" type="button" data-toggle="dropdown"
                    aria-haspopup="true" aria-expanded="true">
                    <i id="calendarTypeIcon" class="calendar-icon ic_view_month" style="margin-right: 4px;"></i>
                    <span id="calendarTypeName">Dropdown</span>&nbsp;
                    <i class="calendar-icon tui-full-calendar-dropdown-arrow"></i>
                </button>
                <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu-calendarType">
                    <li role="presentation">
                        <a class="dropdown-menu-title" role="menuitem" data-action="toggle-daily">
                            <i class="calendar-icon ic_view_day"></i>일
                        </a>
                    </li>
                    <li role="presentation">
                        <a class="dropdown-menu-title" role="menuitem" data-action="toggle-weekly">
                            <i class="calendar-icon ic_view_week"></i>주
                        </a>
                    </li>
                    <li role="presentation">
                        <a class="dropdown-menu-title" role="menuitem" data-action="toggle-monthly">
                            <i class="calendar-icon ic_view_month"></i>월
                        </a>
                    </li>
                    <li role="presentation">
                        <a class="dropdown-menu-title" role="menuitem" data-action="toggle-weeks2">
                            <i class="calendar-icon ic_view_week"></i>2주
                        </a>
                    </li>
                    <li role="presentation">
                        <a class="dropdown-menu-title" role="menuitem" data-action="toggle-weeks3">
                            <i class="calendar-icon ic_view_week"></i>3주
                        </a>
                    </li>
                    <li role="presentation" class="dropdown-divider"></li>
                    <li role="presentation">
                        <a role="menuitem" data-action="toggle-workweek">
                            <input type="checkbox" class="tui-full-calendar-checkbox-square" value="toggle-workweek" checked>
                            <span class="checkbox-title"></span>주말 보기
                        </a>
                    </li>
                    <li role="presentation">
                        <a role="menuitem" data-action="toggle-start-day-1">
                            <input type="checkbox" class="tui-full-calendar-checkbox-square" value="toggle-start-day-1">
                            <span class="checkbox-title"></span>월요일에 시작
                        </a>
                    </li>
                    <li role="presentation">
                        <a role="menuitem" data-action="toggle-narrow-weekend">
                            <input type="checkbox" class="tui-full-calendar-checkbox-square" value="toggle-narrow-weekend">
                            <span class="checkbox-title"></span>주말 작게 보기
                        </a>
                    </li>
                </ul>
            </span>
            <span id="menu-navi">
                <button type="button" class="btn btn-default btn-sm move-today" data-action="move-today">오늘</button>
                <button type="button" class="btn btn-default btn-sm move-day" data-action="move-prev">
                    <i class="calendar-icon ic-arrow-line-left" data-action="move-prev"></i>
                </button>
                <button type="button" class="btn btn-default btn-sm move-day" data-action="move-next">
                    <i class="calendar-icon ic-arrow-line-right" data-action="move-next"></i>
                </button>
            </span>
            <span id="renderRange" class="render-range"></span>
        </div>
        <div id="calendar"></div>
    </div>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="https://uicdn.toast.com/tui.code-snippet/latest/tui-code-snippet.min.js"></script>
    <script type="text/javascript" src="https://uicdn.toast.com/tui.time-picker/latest/tui-time-picker.min.js"></script>
    <script type="text/javascript" src="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.20.1/moment.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/chance/1.0.13/chance.min.js"></script>
    <script src="/javascript/tui/tui-calendar.js" charset="utf-8"></script>
    <script src="/javascript/tui/data/calendars.js"></script>
    <script src="/javascript/tui/data/schedules.js" charset="utf-8"></script>
    <script>
    	var renderRangeStart;
    	var renderRangeEnd;
		var calendar;
		<c:forEach var="userCategory" items="${interestCategoryList}">
			calendar = new CalendarInfo();
			calendar.id = "${userCategory.userCategoryNo}";
			calendar.name = "${userCategory.userCategoryName}";
	 		calendar.color = "#000000";
			calendar.bgColor = "${userCategory.userCategoryColor}";
			calendar.dragBgColor = "${userCategory.userCategoryColor}";
			calendar.borderColor = "${userCategory.userCategoryColor}";
			addCalendar(calendar);
		</c:forEach>
		
		function fncAdjustScheduleValues(schedule){
			console.log(schedule);
			schedule.isAllday = true;
			schedule.category = 'allday';
			
			var quotient = Math.floor((schedule.start*=1)/86400000);
						
			schedule.start = new Date((quotient+1)*86400000);
			schedule.end = new Date((quotient+1)*86400000-1); 
			return schedule;
		}
		
		var schedule;
		<c:forEach var="schedule" items="${calendarMovieList}">
			schedule = new ScheduleInfo();
			schedule.id = "${schedule.scheduleNo}";
			schedule.calendarId = "${schedule.userCategoryNo}";
			schedule.title = "${schedule.scheduleTitle}";
			schedule.body = "${schedule.scheduleDetail}";
			schedule.location = "${schedule.scheduleLocation}";
			schedule.start = "${schedule.scheduleStartDate}";
			schedule.end = "${schedule.scheduleEndDate}";
			schedule.goingDuration = "${schedule.goingDuration}";
			schedule.comingDuration = "${schedule.comingDuration}";
			schedule.isAllday = "${schedule.isScheduleDDay}";
			schedule.state = "${schedule.markDDay}";
			schedule.category = "${schedule.isScheduleImportant}";
			schedule.recurrenceRule = "${schedule.scheduleAlarmTime}";
			schedule = fncAdjustScheduleValues(schedule);
			ScheduleList.push(schedule);
		</c:forEach>
    </script>
    
    <script src="/javascript/tui/theme/dooray.js"></script>
    <script src="/javascript/tui/calendar-interest-setting.js" charset="utf-8"></script>
</body>
</html>
