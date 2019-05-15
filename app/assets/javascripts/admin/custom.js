$(document).ready(function(){
  jQuery.noConflict();

	showMenuBar();

  activaTab('lessons');

	$('.autohide').delay(2000).slideUp('slow');
  
  CKEDITOR.config.height = 500;
});

function activaTab(tab){
  $('.nav-tabs a[href="#' + tab + '"]').tab('show');
};

function showMenuBar(){
  var url = window.location.pathname;
  var urlRegExp = new RegExp(url.replace(/\/$/, '') + "$");
  $('#sidebar a').each(function(){
    if(urlRegExp.test(this.href.replace(/\/$/, ''))){
      $(this).addClass('active');
    }
  });
}

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

$(document).on('click', '#edit-chapter', function() {
  $.ajax({
    url: $(this).data('url'),
    type: 'GET',
    dataType: 'script',
    data: {
      course_id: $(this).data('courseId')
    }
  });
});

$(document).on('click', '#new-question', function() {
  $.ajax({
    url: $(this).data('url'),
    type: 'GET',
    dataType: 'script',
    data: {
    }
  });
});