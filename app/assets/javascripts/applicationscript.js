var ready = function() {	

	$("i.fa-plus-square").click(function() {
		var field = $(this).parent().next().next().children();
		var value = parseInt(field.val())
		field.val(value + 1);
	});

	$("i.fa-minus-square").click(function() {
		var field = $(this).parent().prev().children();
		var value = parseInt(field.val());
		field.val(value - 1);
	});	

	$('a').tooltip();

	$scrollbar = $('.scroll-bar');
	if (typeof $scrollbar[0] != 'undefined') {
		height = $scrollbar[0].scrollHeight;
		$scrollbar.scrollTop(height);
	}
	
	$myTabs_links = $('#myTabs a')
	if (typeof $myTabs_links != 'undefined') {
		$('#myTabs li:eq(0) a').tab('show')
	};

	$('#myTabs a').click(function (e) {
		e.preventDefault()
		$(this).tab('show')
	});

	variable = $('#room_title').val();
	if (typeof variable != "undefined") { 
	    updateCountdown();
	    $('#room_title').on('input', updateCountdown);
	    $('#room_title').keyup(updateCountdown);
	};	
}

$(document).on('turbolinks:load', ready);

function updateCountdown() {
    var remaining = 15 - $('#room_title').val().length;
    var total = $('#room_title').val().length
    jQuery('.countdown').text(total + ' characters, ' + remaining + ' characters remaining.');
}