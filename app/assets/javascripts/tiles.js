$.getJSON("http://localhost:3000/api/soup", function(response, status, jqXHR){
	$(".soup").find('p').eq(0).html(response.name);
	$('<img>', {src: response['image_url'], class: 'img-responsive'}).appendTo("#soup");
	$(".soup").find('p').eq(1).html(response.description);

});

$.getJSON("http://localhost:3000/api/weather", function(response, status, jqXHR){
	$(".weather").find('p').eq(0).html(response.location);
	$(".weather").find('p').eq(1).html(response.current_temp);
	$('<img>', {src: response['icon'], class: 'img-responsive'}).appendTo(".weather");


});

$.getJSON("http://localhost:3000/api/word", function(response, status, jqXHR){
	$(".word").find('p').eq(0).html(response.word);
	$(".word").find('p').eq(1).html(response.definition);

});

$.getJSON("http://localhost:3000/api/reddit", function(response, status, jqXHR){
	$(".reddit").find('p').eq(0).html(response.title);
	$(".reddit").find('p').eq(1).html(response.permalink);

});

$.getJSON("http://localhost:3000/api/restaurant", function(response, status, jqXHR){
	$(".restaurant").find('p').eq(0).html(response.bizname);
	$('<img>', {src: response['rating'], class: 'img-responsive'}).appendTo(".restaurant");
	$('<img>', {src: response['first_img'], class: 'img-responsive'}).appendTo("#restaurant");
	$(".restaurant").find('p').eq(1).html(response.comment);

});

$.getJSON("http://localhost:3000/api/beer", function(response, status, jqXHR){
	$(".beer").find('p').eq(0).html(response.beer);
	$(".beer").find('p').eq(1).html(response.description);

});

$.getJSON("http://localhost:3000/api/event", function(response, status, jqXHR){
	$('<img>', {src: response['event_pic'], class: 'img-responsive'}).appendTo("#event");
	$(".event").find('p').eq(0).html(response.name);

});

$.getJSON("http://localhost:3000/api/recipe", function(response, status, jqXHR){
	$('<img>', {src: response['image'], class: 'img-responsive'}).appendTo("#recipe");
	$(".recipe").find('p').eq(0).html(response.name);

});

$.getJSON("http://localhost:3000/api/news", function(response, status, jqXHR){
	$('<img>', {src: response['image'], class: 'img-responsive'}).appendTo("#news");
	$(".news").find('p').eq(0).html(response.title);

});
// external js: isotope.pkgd.js
$(document).ready( function() {

$(window).load(function() {

  var $grid = $('.grid').imagesLoaded(function() {
    $grid.isotope({
    	itemSelector: '.grid-item',
	    layoutMode: 'masonry',
	    masonry: {
	      columnWidth: 50
	    }

	});
  });

  $grid.on( 'click', '.grid-item', function() {
    // change size of item by toggling gigante class
    $( this ).toggleClass('gigante');
    $grid.isotope('layout');
  });

  $('.shuffle-div').on( 'click', function() {
  $grid.isotope('shuffle');
});

 });
  
})



