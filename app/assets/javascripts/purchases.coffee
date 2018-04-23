$(document).on 'turbolinks:load', ->
  new Purchase()
  
class Purchase
  constructor: () -> 
    @submit = $('#submit')
    @products = $.map $('.product-partial'), (product, i) -> 
      new Product(product)
    @onSubmit()
  onSubmit: -> 
    @submit.click =>
      console.log Product.serialize()["purchase"]["price"]
      console.log Product.serialize()
      $.ajax
        url: "/purchases"
        method: "POST"
        dataType: "json"
        data: Product.serialize()
        error: (jqXHR, textStatus, errorThrown) ->
          console.log "AJAX Error: #{textStatus}"
        success: (data, textStatus, jqXHR) ->
          console.log "Successful AJAX call: #{data}"         

class Product
  @items: []
  @host: "https://s3.eu-central-1.amazonaws.com/sprachspiel/"
  @numbers: ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten"]
  constructor: (product) ->
    @product = $(product)
    @id = @product.data("id")
    @icon = @product.find('img[data-name=icon]')
    @amount ||= 0
    @sequence = {}
    @setHash index for index in [0..9]
    @setEvent()
  setEvent: =>
    @product.click =>
      @increaseItemCount()
      @changeIcon() 
      Product.items.push new Item(@id)  
  increaseItemCount: () -> 
    @amount += 1
  setHash: (index) -> @sequence[index + 1] = Product.numbers[index]
  changeIcon: ->
    newlink = Product.host + @sequence[@amount] + ".svg"
    @icon.attr("src", newlink)
    @icon.removeClass('hidden')
  @getPrice: ->
    priceButton = $('#price-amount')
    parseInt(priceButton.html())
  @serialize: =>
    purchase:
      price: Product.getPrice()
      items_attributes: (item.serialize() for item in Product.items)    

class Item
  constructor: (@product_id)->
  serialize: => 
    product_id: @product_id.toString()
