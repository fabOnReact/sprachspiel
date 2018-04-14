$(document).on 'turbolinks:load', ->
  Icon.init()
  $('.product-partial.col-md-3').click -> 
    Icon.changeImage(this)

Icon = 
  host: "https://s3.eu-central-1.amazonaws.com/sprachspiel/"
  numbers: ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten"]
  sequence: {}
  products: {}
  init: () ->  @setHash index for index in [0..9]  
  increaseItemCount: (count, product_id) -> 
    @products[product_id] ||= 0
    @products[product_id] += 1
  setHash: (index) -> @sequence[index + 1] = @numbers[index]
  changeImage: (element) ->
    $icon = $($(element).find('img')[0])
    product_id = $icon.next()[0].id
    @increaseItemCount(@count, product_id)
    newlink = @host + @sequence[@products[product_id]] + ".svg"
    $icon.attr("src", newlink)