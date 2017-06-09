var ready = function() {	
	var max = $("tbody > tr").length - 1
	for (var i = 0; i < max; i++) {
		var string = i.toString();
		var row = ".row"
		var plus_square = row + string + " #plus-square";
		var number_field = row + string + " #number_field";
		var minus_square = row + string + " #minus-square";

		$("i.fa-plus-square").click(function() {
			var field = $(this).parent().next().next().children();
			console.log(field)
			var value = parseInt(field.val())
			field.val(value + 1);
		});

		$("i.fa-minus-square").click(function() {
			var field = $(this).parent().prev().children();
			var value = parseInt(field.val());
			field.val(value - 1);
		});	
	};
}

$(document).on('turbolinks:load', ready);


/* GET companies#new Update char count */

function updateCountdown() {
    // 360 is the max description length
    var remaining = 15 - $('#room_title').val().length;
    var total = $('#room_title').val().length
    jQuery('.countdown').text(total + ' characters, ' + remaining + ' characters remaining.');
}


/*$(document).on('turbolinks:load', ready);*/

$(document).on('turbolinks:load', function() {
	variable = $('#room_title').val();
	if (typeof variable != "undefined") { 
	    updateCountdown();
	    $('#room_title').on('input', updateCountdown);
	    $('#room_title').keyup(updateCountdown);
	};
});