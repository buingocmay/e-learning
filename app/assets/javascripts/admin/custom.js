$(document).ready(function(){
  jQuery.noConflict();
	var url = window.location.pathname;
	var urlRegExp = new RegExp(url.replace(/\/$/, '') + "$");
	$('#sidebar a').each(function(){
		if(urlRegExp.test(this.href.replace(/\/$/, ''))){
			$(this).addClass('active');
		}
	});

	$('.autohide').delay(2000).slideUp('slow');

});

$(document).on('click', '#edit-category', function() {
  $.ajax({
    url: $(this).data('url'),
    type: 'GET',
    dataType: 'script'
  });
});

$(document).on('click', '#new-unit', function() {
  $.ajax({
    url: $(this).data('url'),
    type: 'GET',
    dataType: 'script'
  });
});

$(document).on('click', '#edit-unit', function() {
  $.ajax({
    url: $(this).data('url'),
    type: 'GET',
    dataType: 'script'
  });
});

$(document).on('click', '#new-course', function() {
  $.ajax({
    url: $(this).data('url'),
    type: 'GET',
    dataType: 'script',
    data: {
      unit_id: $(this).data('unitId')
    }
  });
});

$(document).on('click', '#edit-course', function() {
  $.ajax({
    url: $(this).data('url'),
    type: 'GET',
    dataType: 'script',
    data: {
      unit_id: $(this).data('unitId')
    }
  });
});

$(document).on('click', '#new-chapter', function() {
  $.ajax({
    url: $(this).data('url'),
    type: 'GET',
    dataType: 'script',
    data: {
      course_id: $(this).data('courseId')
    }
  });
});