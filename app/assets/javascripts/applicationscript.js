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

	/*row = ($('.scroll-bar').children().children().size() + 1) *100
	$('.scroll-bar').scrollTop(row);*/
	height = $('.scroll-bar')[0].scrollHeight;
	$('.scroll-bar').scrollTop(height);
}

$(document).on('turbolinks:load', ready);


/* GET companies#new Update char count */

function updateCountdown() {
    // 360 is the max description length
    var remaining = 15 - $('#room_title').val().length;
    var total = $('#room_title').val().length
    jQuery('.countdown').text(total + ' characters, ' + remaining + ' characters remaining.');
}

$(document).on('turbolinks:load', function() {
	variable = $('#room_title').val();
	if (typeof variable != "undefined") { 
	    updateCountdown();
	    $('#room_title').on('input', updateCountdown);
	    $('#room_title').keyup(updateCountdown);
	};
});