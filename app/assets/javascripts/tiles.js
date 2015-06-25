$.getJSON("http://localhost:3000/api/soup", function(response, status, jqXHR){
	$(".soup").find('p').eq(0).html(response.name);
	$(".soup img").attr("src", response['image_url']);
	$(".soup").find('p').eq(1).html(response.description);

	$('.soup').click(function(){
		var modalContent = $("#templates .soup-content").clone();
		var modal = $('#soup-modal .modal-dialog');

		modal.empty();

		modalContent.find('.modal-title').html(response.name);
		modalContent.find('img').attr("src", response['image_url']);
		modalContent.find('.modal-body p').html(response.description);

		modalContent.appendTo(modal);
	});

});

$.getJSON("http://localhost:3000/api/weather", function(response, status, jqXHR){
	$(".weather").find('p').eq(0).html(response.location);
	$(".weather").find('p').eq(1).html(response.current_temp);
	$('<img>', {src: response['icon'], class: 'img-responsive'}).appendTo(".weather");


});

$.getJSON("http://localhost:3000/api/word", function(response, status, jqXHR){
	$(".word").find('p').eq(0).html(response.word);
	$(".word").find('p').eq(1).html(response.definition);

	$('.word').click(function(){
		var modalContent = $("#templates .soup-content").clone();
		var modal = $('#word-modal .modal-dialog');

		modal.empty();

		modalContent.find('.modal-title').html(response.word);
		modalContent.find('.modal-body p').html(response.definition);

		modalContent.appendTo(modal);
	});

});

$.getJSON("http://localhost:3000/api/reddit", function(response, status, jqXHR){
	$(".reddit").find('p').eq(0).html(response.title);
	$(".reddit").find('p').eq(1).html(response.permalink);

	$('.reddit').click(function(){
		var modalContent = $("#templates .soup-content").clone();
		var modal = $('#reddit-modal .modal-dialog');

		modal.empty();

		modalContent.find('.modal-title').html("Reddit");
		modalContent.find('.modal-body p').html(response.title);

		modalContent.appendTo(modal);
	});

});

$.getJSON("http://localhost:3000/api/restaurant", function(response, status, jqXHR){
	$(".restaurant").find('p').eq(0).html(response.bizname);
	$('<img>', {src: response['rating'], class: 'img-responsive'}).appendTo(".restaurant");
	$('<img>', {src: response['first_img'], class: 'img-responsive'}).appendTo("#restaurant");
	$(".restaurant").find('p').eq(1).html(response.comment);

	$('.restaurant').click(function(){
		var modalContent = $("#templates .soup-content").clone();
		var modal = $('#restaurant-modal .modal-dialog');

		modal.empty();

		modalContent.find('.modal-title').html(response.bizname);
		modalContent.find('img').attr("src", response['first_img']);
		modalContent.find('.modal-body p').html(response.comment);

		modalContent.appendTo(modal);
	});
});

$.getJSON("http://localhost:3000/api/beer", function(response, status, jqXHR){
	$(".beer").find('p').eq(0).html(response.beer);
	$(".beer").find('p').eq(1).html(response.description);

	$('.beer').click(function(){
		var modalContent = $("#templates .soup-content").clone();
		var modal = $('#beer-modal .modal-dialog');

		modal.empty();

		modalContent.find('.modal-title').html(response.beer);
		modalContent.find('.modal-body p').html(response.description);

		modalContent.appendTo(modal);
	});

});

$.getJSON("http://localhost:3000/api/event", function(response, status, jqXHR){
	$('<img>', {src: response['event_pic'], class: 'img-responsive'}).appendTo("#event");
	$(".event").find('p').eq(0).html(response.name);

	$('.event').click(function(){
		var modalContent = $("#templates .soup-content").clone();
		var modal = $('#event-modal .modal-dialog');

		modal.empty();

		modalContent.find('.modal-title').html(response.name);
		modalContent.find('img').attr("src", response['event_pic']);
		modalContent.find('.modal-body p').html(response.description);

		modalContent.appendTo(modal);
	});

});

$.getJSON("http://localhost:3000/api/recipe", function(response, status, jqXHR){
	$('<img>', {src: response['image'], class: 'img-responsive'}).appendTo("#recipe");
	$(".recipe").find('p').eq(0).html(response.name);

	$('.recipe').click(function(){
		var modalContent = $("#templates .soup-content").clone();
		var modal = $('#recipe-modal .modal-dialog');

		modal.empty();

		modalContent.find('.modal-title').html(response.name);
		modalContent.find('img').attr("src", response['image']);
		modalContent.find('.modal-body p').html(response.source);

		modalContent.appendTo(modal);
	});

});

$.getJSON("http://localhost:3000/api/news", function(response, status, jqXHR){
	$('<img>', {src: response['image'], class: 'img-responsive'}).appendTo("#news");
	$(".news").find('p').eq(0).html(response.title);

	$('.news').click(function(){
		var modalContent = $("#templates .soup-content").clone();
		var modal = $('#news-modal .modal-dialog');

		modal.empty();

		modalContent.find('.modal-title').html(response.title);
		modalContent.find('img').attr("src", response['image']);
		modalContent.find('.modal-body p').html(response.abstract)
		modalContent.find('.modal-body a').attr("href", response['source']);

		modalContent.appendTo(modal);
	});

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

	$grid.isotope('layout');
  });


  $('.shuffle-div').on( 'click', function() {
    $grid.isotope('shuffle');
  });

 });
  
})



