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
//= require jquery.purr
//= require best_in_place
//= require fullcalendar
//= require jquery-ui

$('.business-click').on('click', function(event) {
	event.preventDefault();
	$('.business-signup').toggle();
});

$(document).ready(function() {
    $( "#accordion" ).accordion();
    
    var calendar = $('#calendar').fullCalendar({
        events: "/events.json",
        selectable: true,
        selectHelper: true,
        allDayDefault: false,
        allDaySlot: false,
        firstHour: 6,
      //   if (eventData.start < todayDate){
      //   alert('You cant choose a date that already past.');
      //   $("#calendar").fullCalendar("unselect");
      //   return
      // },
      dayClick: function(date, allDay, jsEvent, view) {
             $('#event_end_3i > option[value="'+ date.format("D") +'"]').attr('selected','selected');
             $('#event_start_3i > option[value="'+ date.format("D") +'"]').attr('selected','selected');
             $('.date').text(date.format("MMM Do YYYY"));
             $('.eventdate').text("event on" + date.format() + "starts");
             $('.js-modal').modal();
             var today = Date.today;
           if (date < today){
              alert('You cant choose a date that already past.');
              $("#calendar").fullCalendar("unselect");        
            }
        },

       eventClick: function(calEvent, jsEvent, view) {
       var eventtitle = calEvent.title
        var html = [
          '<h2>description:</h2>' + calEvent.description, 
           '<h2>start:</h2>' + calEvent.start,
           '<h2>end:</h2>' + calEvent.end,
           '<h2>transportation choice:</h2>' + calEvent.transportationchoice,
           '<br><a href="#eventedit" class="eventedit">edit this event</a>',
      ].join('');
        $('.eventtitle').text(eventtitle);
        $('.eventdets').html(html);
        $('.eventsconfirmed').modal();

        $('.eventedit').on('click',function () {
            event.preventDefault;
            var form = $('.modal-body').clone(); 
            $('.eventdets').html(form);
        })

      },
        timeFormat: 'h(:mm)',
        editable: true, 
    });
    $('.eventsubmit').on('click', function () {
            var start = $('.eventstart').val();
            var title = $('.eventtitle').val();
            var description =  $('.eventdescription').val();
            var end =  $('.eventend').val();
            var transportation =  $('.transportation').val();
            var publicmaybe = $('.private').val();

             $.ajax({
                    type: 'POST',
                    url: '/events.json',
                    data: {
                        title: title,
                        description: description,
                        start: start,
                        end: end,
                        transportation: transportation,
                        'private': publicmaybe                           
                    },
                    dateType: 'json',
                    success: function (event) {
                      alert(json.msg);
                      $("#calendar").fullCalendar("renderEvent", eventData, true);
                      $("#calendar").fullCalendar("refetchEvents");
                      },
                    error: function (resp) {
                        console.log(resp);
                      }
                });
            $('.js-modal').modal('hide');
           });
});
