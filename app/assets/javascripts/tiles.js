$.getJSON("http://localhost:3000/api/soup", function(response, status, jqXHR){
	$(".soup").find('h2').eq(0).html(response.name);
	$('<img>', {src: response['image_url'], class: 'img-responsive'}).appendTo("#soup");
	$(".soup").find('h2').eq(1).html(response.description);

});

$.getJSON("http://localhost:3000/api/weather", function(response, status, jqXHR){
	$(".weather").find('h2').eq(0).html(response.location);
	$(".weather").find('h2').eq(1).html(response.current_temp);

});

$.getJSON("http://localhost:3000/api/word", function(response, status, jqXHR){
	$(".word").find('h2').eq(0).html(response.word);
	$(".word").find('h2').eq(1).html(response.definition);

});

$.getJSON("http://localhost:3000/api/reddit", function(response, status, jqXHR){
	$(".reddit").find('p').eq(0).html(response.title);
	$(".reddit").find('p').eq(1).html(response.permalink);

});

$.getJSON("http://localhost:3000/api/yelp", function(response, status, jqXHR){
	$(".yelp").find('h2').eq(0).html(response.bizname);
	$('<img>', {src: response['rating'], class: 'img-responsive'}).appendTo(".yelp");
	$('<img>', {src: response['first_img'], class: 'img-responsive'}).appendTo("#yelp");
	$(".yelp").find('h2').eq(1).html(response.comment);

});
// external js: isotope.pkgd.js

$( document ).ready( function() {
  // init Isotope
  var $container = $('.isotope').isotope({
    itemSelector: '.tile-item',
    layoutMode: 'fitRows',
    getSortData: {
      name: '.name',
      symbol: '.symbol',
      number: '.number parseInt',
      category: '[data-category]',
      weight: function( itemElem ) {
        var weight = $( itemElem ).find('.weight').text();
        return parseFloat( weight.replace( /[\(\)]/g, '') );
      }
    }
  });

  
});

