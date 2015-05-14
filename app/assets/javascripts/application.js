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
//= require moment
//= require jquery.purr
//= require best_in_place
//= require fullcalendar
//= require jquery-ui/datepicker
//= require jquery-ui/accordion
//= require_tree .

$('.business-click').on('click', function(event) {
	event.preventDefault();
	$('.business-signup').toggle();
  $('.regularform').toggleClass('col-lg-offset-4');
  $('.regularform').toggleClass('col-lg-offset-2');
});

$(document).ready(function() {

  // if $('body').hasClass("page-businessdash") {
  //   want to back a black background if at the homepage
  // $('.navbar-custom a').css("color", "black");
  //   $('.a:visited').css("color", "black");
  // }

    $( "#accordion" ).accordion();
    
    var calendar = $('#calendar').fullCalendar({
        // events: "/events.json",
          eventSources: [

        // your event source
        {
            url: "/events.json", // use the `url` property
            color: 'blue',    // an option!
            textColor: 'black'  // an option!
        },  

        {
           url: "/publicevents.json", // use the `url` property
           color: 'yellow',    // an option!
           textColor: 'black'  // an option!
        }

        // any other sources...

        ],
        selectable: true,
        selectHelper: true,
        allDayDefault: false,
        allDaySlot: false,
        firstHour: 6,
        borderColor: '#61988E',
        timeFormat: 'h(:mm)',
        editable: true, 
       eventClick: showEvent,
      dayClick: function(date, allDay, jsEvent, view) {
          var today = new Date();
           if (date < today){
              alert('You cant choose a date that already past.');
              $("#calendar").fullCalendar("unselect");     
              return   
            }
             $('#event_end_3i > option[value="'+ date.format("D") +'"]').attr('selected','selected');
             $('#event_start_3i > option[value="'+ date.format("D") +'"]').attr('selected','selected');
             $('.date').text(date.format("MMM Do YYYY"));
             $('.js-modal').modal();
        },

    });
    $('.eventsubmit').on('click', submitEvent);
});

function submitEvent(evt, eventId) {
  evt.preventDefault();
  var title = $('.eventtitle').val();
  var description =  $('.eventdescription').val();
  var start =$('#event_start_1i').val() + '-' +$('#event_start_2i').val() +  '-' + $('#event_start_3i').val() + ' ' + $('#event_start_4i').val()  + ':' +$('#event_start_5i').val()
  var end =  $('#event_end_1i').val() + '-' +$('#event_end_2i').val() +  '-' + $('#event_end_3i').val() + ' ' + $('#event_end_4i').val()  + ':' +$('#event_end_5i').val()
  var transportation =  $('#event_transportationschoice').val();
  var publicmaybe = $('.private').val();

  var type, url;
  console.log(eventId);
  if (eventId) {
    type = 'PATCH';
    url = '/events/' + eventId + '.json';
  } else {
    type = 'POST';
    url = '/events.json';
  }
  $.ajax({
    type: type,
    url: url,
    data: {
      event: {
        title: title,
        description: description,
        start: start,
        end: end,
        transportationschoice: transportation,
        'private': publicmaybe 
      }                          
    },
    success: function (event) {
      window.location = '/dash';
    },
    error: function (resp) {
      console.log(resp);
    }
  });
  $("#calendar").fullCalendar("refetchEvents");
  $('.js-modal').modal('hide');
};