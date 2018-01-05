var ready = function() {   

   /* animation for the buildings#index and show */
   $('.menu-mobile div').click(function(e) {
      e.preventDefault()
      $(this).effect("bounce", 600, function() {
         var target_id = '#container' + this.id
         $('#description').hide("drop", 800);
         $('.menu-mobile').hide("drop", 800, function() {
            var $target = $(target_id);
            /*$target.removeClass("hidden-xs");*/
            $target.show("drop", 800);
            /*id = $link[0].id;
            finding out what is target 
            target = "#description" + id;
            $(target).parent().removeClass("hidden-xs");
            $(target).removeClass("hidden-xs");
            $(target).show("drop", 800);
            target = "#flex-box-" + id;
            $(target).show("drop", 800);*/
         });   
      });
      
   });

   /*$('.flex-box #back').click(function(e) {
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
      });  */ 
}

$(document).on('turbolinks:load', ready);