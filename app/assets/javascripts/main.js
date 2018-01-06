var ready = function() {	

	$("a.icon").click(function() {
		$this = $(this);
		var icon = $this.children()[0].className
		if (icon == "fa fa-plus-square fa-3x") {		
			var field = $(this).parent().next().next().children();
			var value = parseInt(field.val())
			field.val(value + 1);
		} else {
			var field = $(this).parent().prev().children();
			var value = parseInt(field.val());
			if (value > 0) { field.val(value - 1); };
		};
	});

	$("i.fa-plus-square").click(function() {
		$this = $(this);
		var field = $this.parent().next().next().children();
		var value = parseInt(field.val())
		field.val(value + 1);
	});	

	$("i.fa-minus-square").click(function() {
		$this = $(this);
		var field = $this.parent().prev().children();
		var value = parseInt(field.val())
		if (value > 0) { field.val(value - 1);};
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
		id = "#" + $(this)[0].innerText;
		if ($(id)[0].innerHTML == "") { $('.tab-content').hide }
	});

	variable = $('#room_title').val();
	if (typeof variable != "undefined") { 
	    updateCountdown();
	    $('#room_title').on('input', updateCountdown);
	    $('#room_title').keyup(updateCountdown);
	};	

	// Triggers functions only for the mobile 
   // used for android phone, to set their 
   // html = screen height in px
	var window_width = $(window).width();
	if (screenWidth(440)) {
		htmlFullDeviceHeight();
	}

	/* Setting the HTML height to the same height of the device compatible with android app */
	function htmlFullDeviceHeight() {
		var device_height = $(window).height() - 8 + 'px';
		$('html').css('height', device_height)
	};
}

$(document).on('turbolinks:load', ready);


// return true if the screen with is lower of the 
// input parameter
function screenWidth(constant) {
   return $(window).width() < constant
}

function updateCountdown() {
    var remaining = 15 - $('#room_title').val().length;
    var total = $('#room_title').val().length
    jQuery('.countdown').text(total + ' characters, ' + remaining + ' characters remaining.');
}