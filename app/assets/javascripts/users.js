// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function() {
	function addInterestTextbox() {
		var $interestsDiv = $('.user_interests').eq(0);

		var $newInterest = $('<input>')
			.addClass('text optional')
			.attr({
				type: 'text',
				name: 'user[interests][]',
				id: 'user_'
			});

		$interestsDiv.append($newInterest);
	}


	$('#add-interest').click(addInterestTextbox);
});