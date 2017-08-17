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

	/* animation for the buildings#index and show */
	$('#buildings_buttons a').click(function(e) {
		e.preventDefault()
		$(this).effect("bounce", 600, function() {
			var $link = $(this)
			$('#description').hide("drop", 800);
			$('#buildings_buttons').hide("drop", 800, function() {
				id = $link[0].id;
				/* finding out what is target */
				target = "#description" + id;
				$(target).parent().removeClass("hidden-xs");
				$(target).removeClass("hidden-xs");
				$(target).show("drop", 800);
				target = "#flex-box-" + id;
				$(target).show("drop", 800);
			});	
		});
		
	});

	$('.flex-box #back').click(function(e) {
		e.preventDefault
			id = $(this).parent()[0].id.replace("flex-box-", "");
			description_id = "#description" + id;
			flex_box_id = "#flex-box-" + id;
			$row = $(this).parent().parent();
			$(flex_box_id).hide("slide", "slow");
			$(description_id).hide("drop", 800, function() {
				$('#buildings_buttons').show("slide", "slow");
				$row.addClass("hidden-xs");
				$(flex_box_id).css("display", "none");
				});	
		});	


	/*(function(o,l,a,r,k,y){
		if(o.olark)return;
		r="script";
		y=l.createElement(r);
		r=l.getElementsByTagName(r)[0]; 
		y.async=1;
		y.src="//"+a;
		r.parentNode.insertBefore(y,r); 
		y=o.olark=function(){
			k.s.push(arguments);
			k.t.push(+new Date)
		}; 
		y.extend=function(i,j){y("extend",i,j)}; 
		y.identify=function(i){y("identify",k.i=i)}; 
		y.configure=function(i,j){	
			y("configure",i,j);
			k.c[i]=j};
			k=y._={s:[],t:[+new Date],c:{},l:a}; 
		})(window,document,"static.olark.com/jsclient/loader.js");*/
	/* custom configuration goes here (www.olark.com/documentation) */
	(function(o,l,a,r,k,y){
		if(o.olark)return;
		r="script";
		y=l.createElement(r);
		r=l.getElementsByTagName(r)[0]; 
		y.async=1;
		y.src="//"+a;
		r.parentNode.insertBefore(y,r); 
		y=o.olark=function(){
			k.s.push(arguments);
			k.t.push(+new Date)
		}; 
		y.extend=function(i,j){y("extend",i,j)}; 
		y.identify=function(i){y("identify",k.i=i)}; 
		y.configure=function(i,j){	
			y("configure",i,j);
			k.c[i]=j};
			k=y._={s:[],t:[+new Date],c:{},l:a}; 
		})(window,document,"static.olark.com/jsclient/loader.js");
	olark.identify('2922-432-10-3248');	
}

$(document).on('turbolinks:load', ready);

function updateCountdown() {
    var remaining = 15 - $('#room_title').val().length;
    var total = $('#room_title').val().length
    jQuery('.countdown').text(total + ' characters, ' + remaining + ' characters remaining.');
}