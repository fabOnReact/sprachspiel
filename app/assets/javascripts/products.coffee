$(document).on 'turbolinks:load', ->
  $('.product-partial.col-md-3').click -> 
    icon.changeImage(this)

 icon = 
  host: "https://s3.eu-central-1.amazonaws.com/sprachspiel/"
  numbers: ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten"]
  setHash = (index) -> hash[index] = numbers[index]
    # @sequence[index] = @numbers[index]
    # return @sequence

  # this part does not work
  links: () ->
    # @sequence = {}
    # it just returns undefined array
    @pushHash(x) for x in [1..10]
    # @pushHash index for index in [0..9]
  changeImage: (element) ->
    $icon = $($(element).find('img')[0])
    number = $icon[0].alt.toLowerCase()
    newlink = @host + @links()[number]
    $icon.attr("src", newlink)
    $icon.attr("alt", @links()[number].split('.')[0])


# $(document).on 'turbolinks:load', ->
#   $('.product-partial.col-md-3').click icon.changeImage(this)

# icon =
#   @host: "https://s3.eu-central-1.amazonaws.com/sprachspiel/"
#   @numbers: ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten"]
#   pushHash: (index) -> @sequence[index] = @numbers[index]
#   links: () ->
#     @sequence ||= {}
#     pushHash index for index in [1..10]
#     # for (i = 0; i < 10; i++) {
#     #     variable = variable || {}
#     #     variable[@numbers[i]] = @numbers[i+1] + ".svg";
#     #     if (i == 9){ variable[@numbers[i]] = "ten.svg";}
#     # }
#     # return variable
#   changeImage: (element) ->
#     $icon = $($(element).find('img')[0]);
#     number = $icon[0].alt.toLowerCase();
#     newlink = @host + @links()[number];
#     $icon.attr("src", newlink);
#     $icon.attr("alt", @links()[number].split('.')[0]);

# # // var ready = function() {
# # //   $('.product-partial.col-md-3').click(function(){
# # //     icon.changeImage(this);
# # //   });
# # // }

# # // var icon = {
# # //   host: "https://s3.eu-central-1.amazonaws.com/sprachspiel/",
# # //   numbers: ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten"],
# # //   links: function(){
# # //     for (i = 0; i < 10; i++) {
# # //         variable = variable || {}
# # //         variable[this.numbers[i]] = this.numbers[i+1] + ".svg";
# # //         if (i == 9){ variable[this.numbers[i]] = "ten.svg";}
# # //     }
# # //     return variable
# # //   },
# # //   changeImage: function(element) {
# # //     $icon = $($(element).find('img')[0]);
# # //     number = $icon[0].alt.toLowerCase();
# # //     newlink = this.host + this.links()[number];
# # //     $icon.attr("src", newlink);
# # //     $icon.attr("alt", this.links()[number].split('.')[0]);
# # //   }
# # // }