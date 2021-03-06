// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs

//= require 'bootstrap'
//= require 'jquery.backstretch'
//= require 'jquery.waypoints'
//= require 'jquery.countTo'
//= require 'jquery.fitvids'
//= require 'jquery.magnific-popup'
//= require 'jquery.simple-text-rotator'
//= require 'smoothscroll'
//= require 'wow'
//= require 'custom'

//= require_tree .


$(document).ready(function() {
  $(".js-show-hide").click(function() {
    var selector = "." + $(this).attr('data-selector');
    if ($(selector).is(":visible")) {
      $(selector).slideUp();
    }
    else {
      $(selector).slideDown();
    }
    return false;
  });
});
