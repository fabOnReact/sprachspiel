var ready = function() {
    
    $('.options a').tooltip();

}

$(document).on('turbolinks:load', ready);


/* GET companies#new Update char count */

function updateCountdown() {
    // 360 is the max description length
    var remaining = 15 - $('#room_title').val().length;
    var total = $('#room_title').val().length
    jQuery('.countdown').text(total + ' characters, ' + remaining + ' characters remaining.');
}


$(document).on('turbolinks:load', ready);

$(document).on('turbolinks:load', function() {
	variable = $('#room_title').val();
	if (typeof variable != "undefined") { 
	    updateCountdown();
	    $('#room_title').on('input', updateCountdown);
	    $('#room_title').keyup(updateCountdown);
	};
});