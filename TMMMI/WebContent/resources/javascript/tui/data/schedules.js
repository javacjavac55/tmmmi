'use strict';

/*eslint-disable*/

var ScheduleList = [];

var SCHEDULE_CATEGORY = [
    'milestone',
    'task'
];

function ScheduleInfo() {
    this.id = null;
    this.calendarId = null;

    this.title = null;
    this.body = null;
    this.location = '';
    this.start = null;
    this.end = null;
    this.goingDuration = 0;
    this.comingDuration = 0;
    
    //기념일
    this.isAllday = false;
    //기념일 -+ 표시 
    //busy=- 
    //free=+
    this.state = '';
    
    //milestone = 중요한 일정
    this.category = '';

    //일정 알람 시간
    this.recurrenceRule = '';
    
}

function generateTime(schedule, renderStart, renderEnd) {
	var baseDate = new Date(renderStart);
    var singleday = chance.bool({likelihood: 70});
    var startDate = moment(renderStart.getTime());
    
    var endDate = moment(renderEnd.getTime());
    var diffDate = endDate.diff(startDate, 'days');

    schedule.isAllday = chance.bool({likelihood: 30});
    if (schedule.isAllday) {
        schedule.category = 'allday';
    } else if (chance.bool({likelihood: 30})) {
        schedule.category = SCHEDULE_CATEGORY[chance.integer({min: 0, max: 1})];
        if (schedule.category === SCHEDULE_CATEGORY[1]) {
        	schedule.category='';
        }
    } else {
        schedule.category = 'time';
    }

    startDate.add(chance.integer({min: 0, max: diffDate}), 'days');
    startDate.hours(chance.integer({min: 0, max: 23}))
    startDate.minutes(chance.bool() ? 0 : 30);
    schedule.start = startDate.toDate();

    endDate = moment(startDate);
    if (schedule.isAllday) {
        endDate.add(chance.integer({min: 0, max: 3}), 'days');
    }

    schedule.end = endDate
        .add(chance.integer({min: 1, max: 4}), 'hour')
        .toDate();
    
    console.log(schedule.end);

    if (!schedule.isAllday && chance.bool({likelihood: 20})) {
        schedule.goingDuration = 30/*chance.integer({min: 30, max: 120})*/;
        schedule.comingDuration = 60/*chance.integer({min: 30, max: 120})*/;

        if (chance.bool({likelihood: 50})) {
            schedule.end = schedule.start;
        }
    }
}

function generateRandomSchedule(calendar, renderStart, renderEnd) {
    var schedule = new ScheduleInfo();

    schedule.id = chance.guid();
    schedule.calendarId = calendar.id;

    schedule.title = chance.sentence({words: 3});
    schedule.body = chance.bool({likelihood: 20}) ? chance.sentence({words: 10}) : '';
    schedule.location = chance.address();
    
    generateTime(schedule, renderStart, renderEnd);
    schedule.state = chance.bool({likelihood: 50}) ? 'D-Day' : 'D+Day';
    
    schedule.recurrenceRule = chance.bool({likelihood: 20}) ? '50분 전' : '30분 전';

    if (schedule.category === 'milestone') {
        schedule.color = schedule.bgColor;
        schedule.bgColor = 'transparent';
        schedule.dragBgColor = 'transparent';
        schedule.borderColor = 'transparent';
    }
    
    ScheduleList.push(schedule);
}

function generateSchedule(viewName, renderStart, renderEnd) {
    ScheduleList = [];
    CalendarList.forEach(function(calendar) {
        var i = 0, length = 10;
        if (viewName === 'month') {
            length = 3;
        } else if (viewName === 'day') {
            length = 4;
        }
        for (; i < length; i += 1) {
            generateRandomSchedule(calendar, renderStart, renderEnd);
        }
    });
}
