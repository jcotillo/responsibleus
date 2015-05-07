function showEvent (calEvent, jsEvent, view) {
   var eventtitle = calEvent.title

    var html = [
      '<h2>description:</h2>' + calEvent.description, 
       '<h2>start:</h2>' + calEvent.start,
       '<h2>end:</h2>' + calEvent.end,
       '<h2>transportation choice:</h2>' + calEvent.transportationchoice,
       '<br><a href="#eventedit" class="eventedit">edit this event</a>',
       '<br><a href="#eventedit" class="eventdelete">delete this event</a>'
  ].join('');
    $('.eventtitle').text(eventtitle);
    $('.eventdets').html(html);
    $('.eventsconfirmed').modal();

    $('.eventedit').on('click',function () {
        event.preventDefault;
        var form = $('.modal-body').clone(); 
        $('.modal-body').html(form);
        $('.modal-body eventdets').remove();
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