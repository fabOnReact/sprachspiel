var ready = function() {
    
    $('.options a').tooltip();

}

$(document).on('turbolinks:load', ready);