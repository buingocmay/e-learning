$(document).ready(function(){
  $('.autohide').delay(2000).slideUp('slow');
});

$(document).on('click', '#register-course', function() {
  $.ajax({
    url: $(this).data('url'),
    type: 'GET',
    dataType: 'script',
    data: {
      course_id: $(this).data('courseId'),
      user_id: $(this).data('userId')
    }
  });
});
