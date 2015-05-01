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

    $('#calendar').fullCalendar({
    eventSources: [
        // your event source
        {
            url: '/events.json', // use the `url` property
            color: 'yellow',    // an option!
            textColor: 'black'  // an option!
        }
     ]
    editable: true
    //          // any other sources...
    // dayClick: function(date) {
    //    $('.date').text(date.format("MMM Do YYYY"));
    //    $('.eventdate').text("event on" + date.format() + "starts");
    //    $('.js-modal').modal();
    //    // $('.eventsubmit').on('click', function () {

    //    // });

    }
});
