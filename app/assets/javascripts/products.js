var ready = function() {
  $('img.color').click(function(){
    event.preventDefault();
    var host = "https://s3.eu-central-1.amazonaws.com/sprachspiel/";
    var numbers = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten"];
    var links = {}
    for (i = 0; i < 10; i++) {
      links[numbers[i]] = numbers[i+1] + ".svg";
      if (i == 9){ links[numbers[i]] = "ten.svg";}
    }
    $icon = $(this).prev();
    var number = $icon[0].alt.toLowerCase();
    var newlink = host + links[number];
    $icon.attr("src", newlink);
    $icon.attr("alt", links[number].split('.')[0]);
  });
}

/*$('img.color').click(function(){
  var host = "https://s3.eu-central-1.amazonaws.com/sprachspiel/"
  var links = {"one": "two.svg", "two":"three.svg", "three" : "four.svg"}
  $icon = $(this).prev();
  var number = $icon[0].alt.toLowerCase()
  var newlink = host + links[number]
  $icon.attr("src", newlink);
  $icon.attr("alt", links[number].split('.')[1]);
});*/

$(document).on('turbolinks:load', ready);