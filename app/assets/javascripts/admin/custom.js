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