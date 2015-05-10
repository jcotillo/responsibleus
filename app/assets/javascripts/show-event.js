function showEvent (calEvent, jsEvent, view) {

    if ('calEvent.private == true') {
   var eventtitle = calEvent.title

    var html = [
       '<div class="eventdets"><h6><u><a href="#eventedit" class="eventedit">edit this event</a></u> ',
       '<u><a href="#eventedit" class="eventdelete">delete this event</a></u></h6>',
      '<h2>description:</h2>' + calEvent.description, 
       '<h2>start:</h2>' + calEvent.start.calendar (),
       '<h2>end:</h2>' + calEvent.end.calendar (),
       '<h2>transportation choice:</h2>' + calEvent.transportationschoice + '</div>'
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

         var start = $('.eventstart').val(calEvent.start);
        var title = $('.eventtitle').val(calEvent.title);
        var description =  $('.eventdescription').val(calEvent.description);
        var end =  $('.eventend').val(calEvent.end);
        var transportation =  $('.transportation').val(calEvent.transportationschoice);
        
         $('.eventsubmit').on('click', function () { 
             $.ajax({
                    type: 'PATCH',
                    url: '/events/' + calEvent.id + '.json',
                    data: {
                        title: title,
                        description: description,
                        start: start,
                        end: end,
                        transportation: transportation,                          
                    },
                    dateType: 'json',
                    success: function (event) {
                      $('.js-modal').modal('hide');
                      // $("#calendar").fullCalendar("renderEvent", eventData, true);
                      $("#calendar").fullCalendar("refetchEvents");
                      },
                    error: function (resp) {
                        console.log(resp);
                      }
                });
            // $("#calendar").fullCalendar("refetchEvents");
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


   } 
   else {
     var eventtitle = calEvent.title

    var html = [
      '<h2>description:</h2>' + calEvent.description, 
       '<h2>start:</h2>' + calEvent.start.calendar (),
       '<h2>end:</h2>' + calEvent.end.calendar (),
       '<h2>transportation choice:</h2>' + calEvent.transportationschoice + '</div>'
  ].join('');
    console.log('hi');
    $('.eventtitle').text(eventtitle);
    $('.eventdets').html(html);
    $('.eventsconfirmed').modal();

   }
  }