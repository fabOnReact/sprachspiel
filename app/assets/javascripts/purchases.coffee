$(document).on 'turbolinks:load', ->
  new Purchase()
  
class Purchase
  @items: []  
  constructor: () -> 
    @submit = $('#submit')
    @products = $.map $('.product-partial'), (product, i) -> 
      new Product(product)
    @onSubmit()
  # data: {}
  # array: []  
  onSubmit: -> 
    @submit.click =>
      # console.log "this is data"
      # data = Purchase.serialize()
      # console.log data      
      $.ajax
         url: "/purchases"
         method: "POST"
         dataType: "json"
         data: Purchase.serialize()
         error: (jqXHR, textStatus, errorThrown) ->
           console.log "AJAX Error: #{textStatus}"
         success: (data, textStatus, jqXHR) ->
           console.log "Successful AJAX call: #{data}"
  @serialize: => 
    purchase:
      items_attributes: (item.serialize() for item in Product.items)           
  # getRow: (product) -> 
  #   i = 0
  #   while i < product.amount
  #     i++ 
  #     "product_id": product.id

class Product
  # @items: []
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
      Purchase.items.push new Item(@id)
  increaseItemCount: () -> 
    @amount += 1
  setHash: (index) -> @sequence[index + 1] = Product.numbers[index]
  changeIcon: ->
    newlink = Product.host + @sequence[@amount] + ".svg"
    @icon.attr("src", newlink)
    @icon.removeClass('hidden')

class Item
  constructor: (@product_id)->
  serialize: => 
    product_id: @product_id.toString()
