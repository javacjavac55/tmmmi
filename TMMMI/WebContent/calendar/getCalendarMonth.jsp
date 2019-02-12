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
    <script src ="https://unpkg.com/sweetalert/dist/sweetalert.min.js" ></script>
    
    <!-- draggable -->
    <style>		
		.schedule {
			border: 2px solid;
			display: inline-block;
			width: 94%;
			margin: 2% 3%;
			padding: 0 !important;
			text-align: center;
			border-top-left-radius: 10px;
    		border-top-right-radius: 10px;
		}
		
		.time {
			display: block;
			color: #ffffff;
		}
		
		.title {
			display: block;
			background-color: #ffffff;
    		width: 99.5%;
		}
		
		.important {
			margin: 0 1%;
		}
		
		#dday-container, #imp-sch-container {
			border-top-left-radius: 13px;
    		border-top-right-radius: 13px;
		}
	</style>
</head>
<body>
    <div id="top">
		TMMMI
    </div>
    <div id="lnb">
        <div class="lnb-new-schedule">
            <button id="btn-new-schedule" type="button" class="btn btn-default btn-block lnb-new-schedule-btn" data-toggle="modal">
                	일정 등록</button>
            <button id="btn-new-category" type="button" class="btn btn-default btn-block lnb-new-schedule-btn">
			카테고리 등록</button>
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
            <div id="imp_dday" style="display:contents;">
            	<c:import url="/calendar/getImportantDday"/>
            </div>            
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
		<c:forEach var="userCategory" items="${userCategoryList}">
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
		
		var schedule;
		<c:forEach var="schedule" items="${scheduleList}">
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
			schedule.isPending = "${schedule.isScheduleImportant}";
			schedule.recurrenceRule = "${schedule.scheduleAlarmTime}";
			schedule = fncAdjustScheduleValues(schedule);
			ScheduleList.push(schedule);
		</c:forEach>
    </script>
    
    <script src="/javascript/tui/theme/dooray.js"></script>
    <script src="/javascript/tui/default.js" charset="utf-8"></script>
    
    <script>
		function fncAddSchedule(schedule){
			console.log("fncAddSchedule");
			console.log(schedule);
			
			$.ajax({
				url : "/calendarRest/addSchedule",
				method : "POST",
				data: JSON.stringify({
					userCategoryNo : schedule.calendarId,
					scheduleTitle : schedule.title,
					scheduleDetail : schedule.body,
					scheduleLocation : schedule.location,
					scheduleStartDate : schedule.start.getTime(),
					scheduleEndDate : schedule.end.getTime(),
					goingDuration : schedule.goingDuration,
					comingDuration : schedule.comingDuration,
					isScheduleDDay : (schedule.isAllDay?1:0),
					markDDay : (schedule.state=='D-Day'?0:1),
					isScheduleImportant : (schedule.isPending?1:0),
					scheduleAlarmTime : schedule.recurrenceRule
				}),
				dataType: "json",
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success : function(JSONData, status) {
					swal({
						title : "등록 완료 " , 
						text: "일정을 성공적으로 등록했습니다" , 
						icon : "success" , 
					}).then((value) => {
						fncGenerate();
					});
				}
			});
		}
		
		function fncUpdateSchedule(schedule){
			console.log("fncUpdateSchedule");
			console.log(schedule);
			
			$.ajax({
				url : "/calendarRest/updateSchedule",
				method : "POST",
				data: JSON.stringify({
					scheduleNo : schedule.id,
					userCategoryNo : schedule.calendarId,
					scheduleTitle : schedule.title,
					scheduleDetail : schedule.body,
					scheduleLocation : schedule.location,
					scheduleStartDate : schedule.start.getTime(),
					scheduleEndDate : schedule.end.getTime(),
					goingDuration : schedule.goingDuration,
					comingDuration : schedule.comingDuration,
					isScheduleDDay : (schedule.isAllDay?1:0),
					markDDay : (schedule.state=='D-Day'?0:1),
					isScheduleImportant : (schedule.isPending?1:0),
					scheduleAlarmTime : schedule.recurrenceRule
				}),
				dataType: "json",
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success : function(JSONData, status) {
					swal({
						title : "수정 완료 " , 
						text: "일정을 성공적으로 수정했습니다" , 
						icon : "success" , 
					}).then((value) => {
						fncGenerate();
					});
				}
			});
		}
		
		function fncDeleteSchedule(schedule){
			console.log("fncDeleteSchedule");
			console.log(schedule);
			
			$.ajax({
				url : "/calendarRest/deleteSchedule",
				method : "POST",
				data: JSON.stringify({
					scheduleNo : schedule.id
				}),
				dataType: "json",
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success : function(JSONData, status) {
					swal({
						title : "삭제 완료 " , 
						text: "일정을 성공적으로 삭제했습니다" , 
						icon : "success" , 
					}).then((value) => {
						fncGenerate();
					});
				}
			});
		}
		
		function fncGenerate() {
			$('#imp_dday').html('');

			$.ajax({
				url : "/calendar/getImportantDday",
				method : "GET",
				dataType: "text",
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success : function(JSONData, status) {
					$('#imp_dday').html(JSONData);
				}
			});
		}
		
		$(function(){
			$('#btn-new-category').on('click', function(){
				$(self).attr('location','getUserCategoryList');
			});
			
			$('.tui-full-calendar-floating-layer.tui-view-14').on("change", function(){
				$('.tui-full-calendar-popup-section-item.tui-full-calendar-section-allday').on("click",function(){
					if (!$('#tui-full-calendar-schedule-allday').is(":checked") && $('#tui-full-calendar-schedule-milestone').is(":checked")) {
						$('.tui-full-calendar-popup-section-item.tui-full-calendar-section-milestone').click();
					}
				});
				
				$('.tui-full-calendar-popup-section-item.tui-full-calendar-section-milestone').on("click",function(){
					if (!$('#tui-full-calendar-schedule-milestone').is(":checked") && $('#tui-full-calendar-schedule-allday').is(":checked")) {
						$('.tui-full-calendar-popup-section-item.tui-full-calendar-section-allday').click();
					}
				})
			});
		})
    </script>
    <jsp:include page="/common/mainMenu.jsp"/>
</body>
</html>
