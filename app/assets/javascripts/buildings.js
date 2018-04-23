// var buildingjs = function() {   

//    // show the building image and description in index.html
//    // when the respective button is clicked in the menu
//    $('.menu-mobile div').click(function(e) {
//       e.preventDefault()
//       $(this).effect("bounce", 600, function() {
//          var target_id = '#container' + this.id
//          $('#description').hide("drop", 800);
//          $('.menu-mobile').hide("drop", 800, function() {
//             var $target = $(target_id);
//             $target.show("drop", 800);
//          });   
//       });
      
//    });

//    // hide the building image and description in index.html
//    // when the back button is clicked
//    $('.btn-primary.btn-lg.btn-mobile#back').click(function(e){
//       console.log('click');
//       e.preventDefault;
//       var parent_id = "#" + $(this).parents()[1].id;
      
//       $(parent_id).hide("drop", 800, function() {
//          $('#description').show("slide", "slow");
//          $('.menu-mobile').show("slide", "slow");
//       });         

//    });

//    $('.col-md-6.col-building').click(function(){
//       url = "/buildings/" + $(this).attr("data-building_id");
//       if (!screenWidth(990)) { Turbolinks.visit(url);};
//    });
// }

// $(document).on('turbolinks:load', buildingjs);
