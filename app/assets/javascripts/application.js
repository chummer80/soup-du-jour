// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require isotope.pkgd.min
//= require tiles
//= require turbolinks
//= require_tree .

var ready = function(){ 
    $("#menu-toggle").click(function(e) {
            e.preventDefault();
            $("#wrapper").toggleClass("active");
    });
};

$(document).ready(ready);
$(document).on('page:load', ready);

$('selector').isotope()

$('.grid').isotope({
  // options
  itemSelector: '.grid-item',
  layoutMode: 'fitRows'
});

var elem = document.querySelector('.grid');
var iso = new Isotope( elem, {
  // options
  itemSelector: '.grid-item',
  layoutMode: 'fitRows'
});