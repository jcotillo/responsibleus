function showEvent (calEvent, jsEvent, view) {

  if (calEvent.private == true || calEvent.business_id == $('.userdash').data('bus')) {
    var eventtitle = calEvent.title

    var html = [
       '<div class="eventdets"><h6><u><a href="#eventedit" class="eventedit">edit this event</a></u>',
       '<u><a href="#eventedit" class="eventdelete">delete this event</a></u></h6>',
      '<h2>description:</h2>' + calEvent.description, 
       '<h2>start:</h2>' + calEvent.start.calendar(), 
       '<h2>end:</h2>' + calEvent.end.calendar(), 
       '<h2>transportation choice:</h2>' + calEvent.transportationschoice + '</div>'
    ].join('');
    console.log(html);
    $('.eventtitle').text(eventtitle);
    $('.eventdets').html(html);
    $('.eventsconfirmed').modal();

    $('.eventedit').on('click',function () {
        event.preventDefault;
        var form = $('.eventform').clone(); 
        form.removeClass('eventform'); 
        $('.eventdets').html(form);

        $('.eventstart').val(calEvent.start);
        $('.eventtitle').val(calEvent.title);
        $('.eventdescription').val(calEvent.description);
        $('.eventend').val(calEvent.end);
        $('.transportation').val(calEvent.transportationschoice);

        console.log('event submit click');
        $('.eventsubmit').on('click', function (evt) {
          console.log('clicked button')
          submitEvent(evt, calEvent.id);
        });
    });



    $('.eventdelete').on('click', function () {
        var answer = confirm('are you sure?');

        if (answer == true ) {
           $.ajax({
                type: 'DELETE',
                url: '/events/' + calEvent.id + '.json',
                success: function () {
                  $('#calendar').fullCalendar( 'removeEvents', calEvent.id  );
                  $('.eventsconfirmed').modal('hide');
                },
                error: function () {
                  console.debug(url)
                  console.debug('WHY WHY WHY WHY WHY WHY')
                }
              })
        }
      });

   } else {

     $.ajax({
        type: 'GET',
        url: '/confirmed/' + calEvent.id + '.json', 
        success: function (events) {

          if (events === null) {

            var eventtitle = calEvent.title
             var html = [
              '<div class="btn-group"><button class="btn btn-info">Click here to join event</button><button type="button" class="btn btn-info dropdown-toggle droppingdown" data-toggle="dropdown" aria-expanded="false">'
              + '<span class="caret"></span>' +
              '<span class="sr-only">Toggle Dropdown</span>' +
              '</button>' +
              '<ul class="dropdown-menu" role="menu">' +
              '<li><a href="#" data-choice="car" class="eventjoin" value="car">Car</a></li>' +
              '<li><a href="#" class="eventjoin" data-choice="Carpool">Carpool</a></li>' +
              '<li><a href="#" class="eventjoin" data-choice="Bus">Bus</a></li>' +
              '<li><a href="#" class="eventjoin" data-choice="Train">Train</a></li>' +
              '<li><a href="#" class="eventjoin" data-choice="Walk">Walk</a></li>'+
              '</ul></div>'+
              '<h2>description:</h2>' + calEvent.description, 
              '<h2>start:</h2>' +  calEvent.start && calEvent.start.calendar(),
              '<h2>end:</h2>' + (calEvent.end ? calEvent.end.calendar() : ' ') + '</div>'
             ].join('');
             $('.eventtitle').text(eventtitle);
             $('.eventdets').html(html);
             $('.eventsconfirmed').modal();

            $('.dropdown-menu li a').on('click', function () {
              console.log(  $(this).data('choice') ) ;
              $.ajax({
                type: 'POST',
                url: '/eventships/' + calEvent.id, 
                data: {
                  transportationschoice:  $(this).data('choice')
                }, 
                success: function () {
                 $('.eventsconfirmed').modal('hide');
                },
                error: function () {
                  console.debug('WHYyyyyyyyyyyyyyyyyy')
                }
               })
            });
          }

          else {

            var eventtitle = calEvent.title
             var html = [
              '<div class="btn-group"><button class="btn btn-info">You are going to this event :)</button></div>'+
              '<h2>description:</h2>' + calEvent.description, 
              '<h2>start:</h2>' +  (calEvent.start ? calEvent.start.calendar() : ''),
              '<h2>end:</h2>' + (calEvent.end ? calEvent.end.calendar() : ' ') + '</div>'
             ].join('');
             $('.eventtitle').text(eventtitle);
             $('.eventdets').html(html);
             $('.eventsconfirmed').modal();

           }
        }, 
        error: function () {
          console.debug('WHYyyyyyyyyyyyyyyyyy')
        }
       })
  }
}