$.getJSON("http://localhost:3000/api/soup", function(response, status, jqXHR){
	$(".soup").find('p').eq(0).html(response.name);
	$('<img>', {src: response['image_url'], class: 'img-responsive'}).appendTo("#soup");
	$(".soup").find('p').eq(1).html(response.description);

});

$.getJSON("http://localhost:3000/api/weather", function(response, status, jqXHR){
	$(".weather").find('p').eq(0).html(response.location);
	$(".weather").find('p').eq(1).html(response.current_temp);

});

$.getJSON("http://localhost:3000/api/word", function(response, status, jqXHR){
	$(".word").find('p').eq(0).html(response.word);
	$(".word").find('p').eq(1).html(response.definition);

});

$.getJSON("http://localhost:3000/api/reddit", function(response, status, jqXHR){
	$(".reddit").find('p').eq(0).html(response.title);
	$(".reddit").find('p').eq(1).html(response.permalink);

});

$.getJSON("http://localhost:3000/api/yelp", function(response, status, jqXHR){
	$(".yelp").find('p').eq(0).html(response.bizname);
	$('<img>', {src: response['rating'], class: 'img-responsive'}).appendTo(".yelp");
	$('<img>', {src: response['first_img'], class: 'img-responsive'}).appendTo("#yelp");
	$(".yelp").find('p').eq(1).html(response.comment);

});
// external js: isotope.pkgd.js
$(document).ready( function() {

  var $grid = $('.grid').isotope({
    itemSelector: '.grid-item',
    masonry: {
      columnWidth: 100
    }
  });

  $grid.on( 'click', '.grid-item', function() {
    // change size of item by toggling gigante class
    $( this ).toggleClass('gigante');
    $grid.isotope('layout');
  });
  
})

