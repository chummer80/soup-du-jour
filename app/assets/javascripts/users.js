// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function() {
	
	/////////////// Code for the Edit Settings page ///////////////
	
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



	/////////////// Code for the Edit Morsels page ///////////////

	var $userMorselSelect = $('select#user_morsels');
	var $availableMorselSelect = $('select#available_morsels');

	// This function moves selected options from one select list to the other.
	// It works in both directions, just depending on which list (if any) 
	// has something selected.
	function toggleMorsel() {
		var $oldSelect = $();
		var $newSelect = $();

		if ($userMorselSelect.val()) {
			$oldSelect = $userMorselSelect;
			$newSelect = $availableMorselSelect;
		}
		else if ($availableMorselSelect.val()) {
			$oldSelect = $availableMorselSelect;
			$newSelect = $userMorselSelect;
		}
		
		// Put all the selected option elements into a jquery object.
		// Unfortunately jquery doesn't have property selector, so it must be done
		// this janky way.
		var selectedMorselNames = $oldSelect.val();
		var $selectedOptions = $();

		for (var i = 0; i < selectedMorselNames.length; i++) {
			var $optionElement = $oldSelect.find('option[value="' + selectedMorselNames[i] +'"]');
			$selectedOptions = $selectedOptions.add($optionElement);
		}

		// Detach these option tags from their current (old) list and 
		// add them to the other (new) list.
		$selectedOptions
			.detach()
			.appendTo($newSelect);

		$newSelect.focus();
	}


	// Make sure only 1 list at a time has selected options
	function deselectOtherList() {
		var $otherSelect;

		// check if option is in user list or available list
		if ($(this).is($userMorselSelect)) {
			$otherSelect = $availableMorselSelect;
		}
		else {
			$otherSelect = $userMorselSelect;
		}

		// de-select all options in the other select element
		$otherSelect.find('option').prop('selected', false);
	}

	function moveMorselsUp() {
		var selectedMorselNames = $userMorselSelect.val();

		for (var i = 0; i < selectedMorselNames.length; i++) {
			var $optionToMove = $userMorselSelect.find('option[value="' + selectedMorselNames[i] +'"]');
			
			// if option is the first one in the list, dont' attempt to move morsels.
			if ($userMorselSelect.find('option:first-child').is($optionToMove)) {
				return;
			}

			var $prevSibling = $optionToMove.prev();

			$optionToMove
				.detach()
				.insertBefore($prevSibling);
		}
	}

	function moveMorselsDown() {
		var selectedMorselNames = $userMorselSelect.val();

		for (var i = selectedMorselNames.length - 1; i >= 0; i--) {
			var $optionToMove = $userMorselSelect.find('option[value="' + selectedMorselNames[i] +'"]');
			
			// if option is the first one in the list, dont' attempt to move morsels.
			if ($userMorselSelect.find('option:last-child').is($optionToMove)) {
				return;
			}

			var $nextSibling = $optionToMove.next();

			$optionToMove
				.detach()
				.insertAfter($nextSibling);
		}
	}

	function showHideToggleButton() {
		var anyOptionSelected = false;

		$('option').each(function(index, element) {
			if ($(element).prop('selected')) {
				anyOptionSelected = true;
			}
		});

		if (anyOptionSelected) {
			// $('#toggle-morsel').show();
			$('#toggle-morsel').removeClass('disabled');
		}
		else {
			// $('#toggle-morsel').hide();
			$('#toggle-morsel').addClass('disabled');
		}
	}

	function showHideUpDownButtons() {
		// Check if user morsel list has anything selected. If not, hide both buttons.
		if (!$userMorselSelect.val()) {
			$('#morsel-up').hide();
			$('#morsel-down').hide();
			return;
		}

		// check if a selected option is at the top of list. If so, hide up button.
		if ($userMorselSelect.find($('option')).first().prop('selected')) {
			$('#morsel-up').hide();
		}
		else {
			$('#morsel-up').show();
		}

		// check if a selected option is at the top of list. If so, hide up button.
		if ($userMorselSelect.find($('option')).last().prop('selected')) {
			$('#morsel-down').hide();
		}
		else {
			$('#morsel-down').show();
		}
	}


	// Build a comma separated list of the morsel names in the user morsels list
	// and set it as the value of the hidden field in the form. This passes the
	// entire set of options in the select element, rather than just the selected
	// options.
	function buildFinalMorselList() {
		var morselList = [];

		var $options = $userMorselSelect.find('option');
		for (var i = 0; i < $options.length; i++) {
			morselList.push($options.eq(i).val());
		}

		$('#final_user_morsels').val(JSON.stringify(morselList));
	}


	// Event handlers
	$('#toggle-morsel').click(function() {
		toggleMorsel();
		buildFinalMorselList();
	});

	// $('#morsel-up').click(function() {
	// 	moveMorselsUp();
	// 	showHideUpDownButtons();
	// 	buildFinalMorselList();
	// });

	// $('#morsel-down').click(function() {
	// 	moveMorselsDown();
	// 	showHideUpDownButtons();
	// 	buildFinalMorselList();
	// });

	$('#morsels-container select').change(function() {
		deselectOtherList.call(this);
		showHideToggleButton();
		// showHideUpDownButtons();
	});
});