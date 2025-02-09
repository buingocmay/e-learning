// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery-1.11.1.min
//= require bootstrap.min
//= require easing
//= require move-top
//= require responsiveslides.min
//= require skdslider.min
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require cable
//= require toastr.min
//= require jquery.countdown
//= require home
function notify(type, text) {
  toastr[type](text, {timeOut: 5000});
}