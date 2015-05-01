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
        selectable: true,
        selectHelper: true,
        allDayDefault: false,
        allDaySlot: false,
        firstHour: 6,

      dayClick: function(date, allDay, jsEvent, view) {
             $('.date').text(date.format("MMM Do YYYY"));
             $('.eventdate').text("event on" + date.format() + "starts");
             $('.js-modal').modal();
        },

       eventClick: function(calEvent, jsEvent, view) {
       var eventinfo = calEvent.title
        var html = [
          '<h2>description:</h2>' + calEvent.description, 
           '<h2>start:</h2>' + calEvent.start ,
      ].join('');
        $('.eventtitle').text(eventinfo);
        $('.eventdets').html(html);
        $('.eventsconfirmed').modal();
  

      },
        // select: function(start, view, JsEvent) {

        //     if (view) {
        //         calendar.fullCalendar('renderEvent',
        //             {
        //                 title: title,
        //                 description: description,
        //                 start: start,
        //                 end: end,
        //                 transportation: transportation
        //             },
        //             false // make the event "stick"
        //         );

        //     var title = $('.eventtitle').val();
        //     var description =  $('.eventdescription').val();
        //     var end =  $('.eventend').val();
        //     var transportation =  $('.transportation').val();


        //   $('.eventsubmit').on('click', function () {
        //      $.ajax({
        //             type: 'POST',
        //             url: '/events.json',
        //             data: {
        //                 title: title,
        //                 description: description,
        //                 startDate: start,
        //                 endDate: end,
        //                 transportation: transportation                            
        //             },
        //             dateType: 'json',
        //             success: function (resp) {
        //                 calendar.fullCalendar('refetchEvents');

        //             }
        //         });
        //   })
               
        //     }
        //     calendar.fullCalendar('unselect');
        // },
        editable: true,
        events: "/events.json",
    });
});
