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
    	#mydiv {
		  position: absolute;
		  z-index: 9;
		  background-color: #ffffff;
		  text-align: center;
		  min-height: 40px;
		  min-width: 300px;
		  right: 0;
		  box-shadow: 3px 3px 10px #aaaaaa;
		}
		
		#mydivheader {
		  padding: 2%;
		  margin: 3%;
		  cursor: move;
		  z-index: 10;
		  color: #000000;
		  flex-wrap:wrap;
		  font-size: larger;
		  border-bottom: 1px solid #eeeeee;
		}
		
		.schedule {
			border: 1px solid;
			display: inline-block;
			width: 44%;
			float: left;
			margin: 0 0 5% 4%;
		}
		
		.time {
			display: block;
			color: #ffffff;
			font-size: large;
			padding: 5% 0;
		}
		
		.title {
			display: block;
			background-color: #ffffff;
			font-size: medium;
			padding: 5% 0;
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
                	���� ���</button>
            <button id="btn-new-category" type="button" class="btn btn-default btn-block lnb-new-schedule-btn">
			ī�װ� ���</button>
        </div>
        <div id="lnb-calendars" class="lnb-calendars">
            <div>
                <div class="lnb-calendars-item">
                    <label>
                        <input class="tui-full-calendar-checkbox-square" type="checkbox" value="all" checked>
                        <span></span>
                        <strong>��� ����</strong>
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
                            <i class="calendar-icon ic_view_day"></i>��
                        </a>
                    </li>
                    <li role="presentation">
                        <a class="dropdown-menu-title" role="menuitem" data-action="toggle-weekly">
                            <i class="calendar-icon ic_view_week"></i>��
                        </a>
                    </li>
                    <li role="presentation">
                        <a class="dropdown-menu-title" role="menuitem" data-action="toggle-monthly">
                            <i class="calendar-icon ic_view_month"></i>��
                        </a>
                    </li>
                    <li role="presentation">
                        <a class="dropdown-menu-title" role="menuitem" data-action="toggle-weeks2">
                            <i class="calendar-icon ic_view_week"></i>2��
                        </a>
                    </li>
                    <li role="presentation">
                        <a class="dropdown-menu-title" role="menuitem" data-action="toggle-weeks3">
                            <i class="calendar-icon ic_view_week"></i>3��
                        </a>
                    </li>
                    <li role="presentation" class="dropdown-divider"></li>
                    <li role="presentation">
                        <a role="menuitem" data-action="toggle-workweek">
                            <input type="checkbox" class="tui-full-calendar-checkbox-square" value="toggle-workweek" checked>
                            <span class="checkbox-title"></span>�ָ� ����
                        </a>
                    </li>
                    <li role="presentation">
                        <a role="menuitem" data-action="toggle-start-day-1">
                            <input type="checkbox" class="tui-full-calendar-checkbox-square" value="toggle-start-day-1">
                            <span class="checkbox-title"></span>�����Ͽ� ����
                        </a>
                    </li>
                    <li role="presentation">
                        <a role="menuitem" data-action="toggle-narrow-weekend">
                            <input type="checkbox" class="tui-full-calendar-checkbox-square" value="toggle-narrow-weekend">
                            <span class="checkbox-title"></span>�ָ� �۰� ����
                        </a>
                    </li>
                </ul>
            </span>
            <span id="menu-navi">
                <button type="button" class="btn btn-default btn-sm move-today" data-action="move-today">����</button>
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
    <div id="mydiv">
	  <!-- Include a header DIV with the same name as the draggable DIV, followed by "header" -->
	  <div id="mydivheader">������ �߿��� ����</div>
	  <div id="imp-sch-container"></div>
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
		var importantList=[];
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
			<c:if test="${schedule.isScheduleImportant!=0}">
				importantList.push(schedule);
			</c:if>
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
						title : "��� �Ϸ� " , 
						text: "������ ���������� ����߽��ϴ�" , 
						icon : "success" , 
					}).then((value) => {
						
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
						title : "���� �Ϸ� " , 
						text: "������ ���������� �����߽��ϴ�" , 
						icon : "success" , 
					}).then((value) => {
						
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
						title : "���� �Ϸ� " , 
						text: "������ ���������� �����߽��ϴ�" , 
						icon : "success" , 
					}).then((value) => {
						
					});
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
    <script>
    	$(function(){
    		for(var i=0; i<importantList.length; i++) {
    			console.log(importantList[i]);
    			console.log(importantList[i].title, importantList[i].start.toString().split(" ")[4])
    			$('#imp-sch-container').append('<div class="schedule" style="background-color:'+importantList[i].bgColor+'; border-color:'
    					+importantList[i].bgColor+'"><span class="time">'
    					+importantList[i].start.toString().split(" ")[4]+'</span><span class="title">'
    					+importantList[i].title+'</span></div>')
    		}
    		
    	})
    	
    	dragElement(document.getElementById("mydiv"));

		function dragElement(elmnt) {
		  var pos1 = 0, pos2 = 0, pos3 = 0, pos4 = 0;
		  if (document.getElementById(elmnt.id + "header")) {
		    // if present, the header is where you move the DIV from:
		    document.getElementById(elmnt.id + "header").onmousedown = dragMouseDown;
		  } else {
		    // otherwise, move the DIV from anywhere inside the DIV: 
		    elmnt.onmousedown = dragMouseDown;
		  }

		  function dragMouseDown(e) {
		    e = e || window.event;
		    e.preventDefault();
		    // get the mouse cursor position at startup:
		    pos3 = e.clientX;
		    pos4 = e.clientY;
		    document.onmouseup = closeDragElement;
		    // call a function whenever the cursor moves:
		    document.onmousemove = elementDrag;
		  }

		  function elementDrag(e) {
		    e = e || window.event;
		    e.preventDefault();
		    // calculate the new cursor position:
		    pos1 = pos3 - e.clientX;
		    pos2 = pos4 - e.clientY;
		    pos3 = e.clientX;
		    pos4 = e.clientY;
		    // set the element's new position:
		    elmnt.style.top = (elmnt.offsetTop - pos2) + "px";
		    elmnt.style.left = (elmnt.offsetLeft - pos1) + "px";
		  }

		  function closeDragElement() {
		    // stop moving when mouse button is released:
		    document.onmouseup = null;
		    document.onmousemove = null;
		  }
		}
	</script>
    <jsp:include page="/common/mainMenu.jsp"/>
</body>
</html>
