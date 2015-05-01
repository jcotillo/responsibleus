// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree .
//= require moment
//= require fullcalendar

$('.business-click').on('click', function(event) {
	event.preventDefault();
	$('.business-signup').toggle();
});

$(document).ready(function() {
     var date = new Date();
    var d = date.getDate();
    var m = date.getMonth();
    var y = date.getFullYear();

    var calendar = $('#calendar').fullCalendar({
        header: {
            left: 'prev,next today',
            center: 'm',
            right: 'agendaMonth,agendaWeek,agendaDay'
        },
        selectable: true,
        selectHelper: true,
        allDayDefault: false,
        allDaySlot: false,
        firstHour: 9,

        dayClick: function(date, allDay, jsEvent, view) {
            // calendar.fullCalendar('gotoDate', date);
             $('.date').text(date.format("MMM Do YYYY"));
             $('.eventdate').text("event on" + date.format() + "starts");
             $('.js-modal').modal();
        },


        select: function(start, end) {

            // var title = prompt('Event Title:');
            if (title) {
                calendar.fullCalendar('renderEvent',
                    {
                        title: title,
                        start: start,
                        end: end
                    },
                    false // make the event "stick"
                );

                var startDateString = $.fullCalendar.formatDate(start, 'yyyy-MM-dd hh:mm');
                var endDateString = $.fullCalendar.formatDate(end, 'yyyy-MM-dd hh:mm');
                $.ajax({
                    type: 'POST',
                    url: '{url}ajaxpost/add',
                    data: {
                        startDate: startDateString,
                        endDate: endDateString,
                        eventTitle: title                            
                    },
                    dateType: 'json',
                    success: function (resp) {
                        calendar.fullCalendar('refetchEvents');

                    }
                });
            }
            calendar.fullCalendar('unselect');
        },
        editable: true,
        events: "/events.json",
    });
});
