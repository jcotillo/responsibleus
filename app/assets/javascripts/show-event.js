function showEvent (calEvent, jsEvent, view) {
   var eventtitle = calEvent.title

    var html = [
       '<div class="eventdets"><h6><u><a href="#eventedit" class="eventedit">edit this event</a></u> ',
       '<u><a href="#eventedit" class="eventdelete">delete this event</a></u></h6>',
      '<h2>description:</h2>' + calEvent.description, 
       '<h2>start:</h2>' + calEvent.start,
       '<h2>end:</h2>' + calEvent.end,
       '<h2>transportation choice:</h2>' + calEvent.transportationchoice + '</div>'
  ].join('');
    console.log('hi');
    $('.eventtitle').text(eventtitle);
    $('.eventdets').html(html);
    $('.eventsconfirmed').modal();

    $('.eventedit').on('click',function () {
        event.preventDefault;
        var form = $('.eventform').clone(); 
        form.removeClass('eventform'); 
        $('.eventdets').html(form);
        console.log($('.eventform'), form);
        console.log($('.eventdets'));
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
  }