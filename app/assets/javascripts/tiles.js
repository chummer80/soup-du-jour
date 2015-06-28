$(document).ready(function() {


	////////// Morsel API callback functions //////////

	// Make the callback functions globally available so we can call them 
	// like this: window.morselCBs["function name"]()
	window.morselCBs = {};

	window.morselCBs.soupCB = function soupCB(response, status, jqXHR) {
		$(".soup").find('p').eq(0).html(response.name);
		$(".soup img").attr("src", response['image_url']);

		$('.soup').click(function(){
			var modalContent = $("#templates .soup-content").clone();
			var modal = $('#soup-modal .modal-dialog');

			modal.empty();

			modalContent.find('.modal-title').html(response.name);
			modalContent.find('img').attr("src", response['image_url']);
			modalContent.find('.modal-body p').html(response.description);

			modalContent.appendTo(modal);
		});
	};

	window.morselCBs.weatherCB = function weatherCB(response, status, jqXHR) {
		$(".weather").find('p').eq(0).html(response.location);
		$(".weather").find('p').eq(1).html(response.current_temp);
		$(".weather img").attr("src", response['image_url']);
	};

	window.morselCBs.wordCB = function wordCB(response, status, jqXHR) {
		$(".word").find('p').eq(0).html(response.word);

		$('.word').click(function(){
			var modalContent = $("#templates .soup-content").clone();
			var modal = $('#word-modal .modal-dialog');

			modal.empty();

			modalContent.find('.modal-title').html(response.word);
			modalContent.find('.modal-body p').html(response.definition);

			modalContent.appendTo(modal);
		});
	};

	window.morselCBs.redditCB = function redditCB(response, status, jqXHR) {
		$(".reddit").find('p').eq(0).html(response.title);
		$(".reddit img").attr("src", response['image']);

		$('.reddit').click(function(){
			var modalContent = $("#templates .soup-content").clone();
			var modal = $('#reddit-modal .modal-dialog');

			modal.empty();

			modalContent.find('.modal-title').html("Reddit");
			modalContent.find('.modal-body p').html(response.title);

			modalContent.appendTo(modal);
		});
	};

	window.morselCBs.restaurantCB = function restaurantCB(response, status, jqXHR) {
		$(".restaurant").find('p').eq(0).html(response.bizname);
		$(".restaurant img").eq(0).attr("src", response['first_img']);

		$('.restaurant').click(function(){
			var modalContent = $("#templates .soup-content").clone();
			var modal = $('#restaurant-modal .modal-dialog');

			modal.empty();

			modalContent.find('.modal-title').html(response.bizname);
			modalContent.find('img').attr("src", response['first_img']);
			modalContent.find('.modal-body p').html(response.comment);

			modalContent.appendTo(modal);
		});
	};

	window.morselCBs.photoCB = function photoCB(response, status, jqXHR) {
		$(".photo").find('p').eq(0).html(response.username);
		$(".photo img").eq(0).attr("src", response['image_url']);

		$('.photo').click(function(){
			var modalContent = $("#templates .soup-content").clone();
			var modal = $('#photo-modal .modal-dialog');

			modal.empty();

			modalContent.find('.modal-title').html(response.username);
			modalContent.find('img').attr("src", response['image_url']);
			modalContent.find('.modal-body p').html(response.caption);

			modalContent.appendTo(modal);
		});
	};

	window.morselCBs.viewCB = function viewCB(response, status, jqXHR) {
		$(".view").find('p').eq(0).html("Instagram");
		$(".view img").eq(0).attr("src", response['image_url']);

		$('.view').click(function(){
			var modalContent = $("#templates .soup-content").clone();
			var modal = $('#view-modal .modal-dialog');

			modal.empty();

			modalContent.find('.modal-title').html("Instagram");
			modalContent.find('img').attr("src", response['image_url']);
			modalContent.find('.modal-body p').html(response.caption);

			modalContent.appendTo(modal);
		});
	};

	window.morselCBs.beerCB = function beerCB(response, status, jqXHR) {
		$(".beer").find('p').eq(0).html(response.beer);
		$(".beer img").attr("src", response['image']);

		$('.beer').click(function(){
			var modalContent = $("#templates .soup-content").clone();
			var modal = $('#beer-modal .modal-dialog');

			modal.empty();

			modalContent.find('.modal-title').html(response.beer);
			modalContent.find('.modal-body p').html(response.description);

			modalContent.appendTo(modal);
		});
	};

	window.morselCBs.charityCB = function charityCB(response, status, jqXHR) {
		$(".charity").find('p').eq(0).html(response.name);
		$(".charity img").attr("src", response['image_url']);

		$('.charity').click(function(){
			var modalContent = $("#templates .soup-content").clone();
			var modal = $('#charity-modal .modal-dialog');

			modal.empty();

			modalContent.find('.modal-title').html(response.name);
			modalContent.find('.modal-body p').html(response.description);

			modalContent.appendTo(modal);
		});
	};

	window.morselCBs.eventCB = function eventCB(response, status, jqXHR) {
		$(".event").find('p').eq(0).html(response.name);
		$(".event img").eq(0).attr("src", response['event_pic']);


		$('.event').click(function(){
			var modalContent = $("#templates .soup-content").clone();
			var modal = $('#event-modal .modal-dialog');

			modal.empty();

			modalContent.find('.modal-title').html(response.name);
			modalContent.find('img').attr("src", response['event_pic']);
			modalContent.find('.modal-body p').html(response.description);

			modalContent.appendTo(modal);
		});
	};

	window.morselCBs.recipeCB = function recipeCB(response, status, jqXHR) {
		$(".recipe").find('p').eq(0).html(response.name);
		$(".recipe img").eq(0).attr("src", response['image']);

		$('.recipe').click(function(){
			var modalContent = $("#templates .soup-content").clone();
			var modal = $('#recipe-modal .modal-dialog');

			modal.empty();

			modalContent.find('.modal-title').html(response.name);
			modalContent.find('img').attr("src", response['image']);
			modalContent.find('.modal-body p').html(response.source);

			modalContent.appendTo(modal);
		});
	};

	window.morselCBs.dealCB = function dealCB(response, status, jqXHR) {

		$(".deal").find('p').eq(0).html(response.title);
		$(".deal img").eq(0).attr("src", response['image']);

		$('.deal').click(function(){
			var modalContent = $("#templates .soup-content").clone();
			var modal = $('#deal-modal .modal-dialog');

			modal.empty();

			modalContent.find('.modal-title').html(response.title);
			modalContent.find('img').attr("src", response['image']);
			modalContent.find('.modal-body p').html(response.description);

			modalContent.appendTo(modal);
		});
	};

	window.morselCBs.newsCB = function newsCB(response, status, jqXHR) {
		$(".news").find('p').eq(0).html(response.title);
		$(".news img").eq(0).attr("src", response['image']);

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

		$.getJSON(baseUrl + "/api/video",function(response, status, jqXHR){
			$(".video iframe").eq(0).attr("src", response['video_url']);
		});

		$.getJSON(baseUrl + "/api/musicvideo",function(response, status, jqXHR){
			$(".musicvideo iframe").eq(0).attr("src", response['video_url']);
		});
	};


	

	////////// Event Handlers //////////

	$(window).load(function() {

		// external js: isotope.pkgd.js
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



	////////// Start morsel API calls //////////

	// Get the list of morsels from the input element hidden in the HTML page
	var morselList = $('select#morsel-list').val();

	for (var i = 0; i < morselList.length; i++) {
		$.getJSON(baseUrl + "/api/" + morselList[i], window.morselCBs[morselList[i] + "CB"]);
	}
});



