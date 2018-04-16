$(document).on 'turbolinks:load', ->
  new Purchase()

class Purchase
  constructor: () -> 
    @submit = $('#submit')
    # @setEvents()
    @products = $.map $('.product-partial'), (product, i) -> 
      new Product(product)
    @setEvents()
  # increaseItemCount: (id) -> 
  #   @amounts[id] ||= 0
  #   @amounts[id] += 1         
  setEvents: ->
    @submit.click => 
      @createPurchase() 
  createPurchase: -> 
    $.ajax
       url: "/products"
       method: "POST"
       dataType: "json"
       data: { items: {product_id: @products[0].id, amount: @products[0].amount }}
       error: (jqXHR, textStatus, errorThrown) ->
         console.log "AJAX Error: #{textStatus}"
       success: (data, textStatus, jqXHR) ->
         console.log "Successful AJAX call: #{data}"
         console.log data

class Product extends Purchase
  constructor: (product) ->
    @product = $(product)
    @id = @product.data("id")
    # @icon = @product.find('img[data-name=icon]')
    div = @product.find('img[data-name=icon]')
    @icon = new Icon(div)
    @setAnotherEvent()
    @amount = {}
  # amounts: {}
  # setEvents: ->
  #   @product.click => 
  #     @changeIcon()   
  setAnotherEvent: ->
    @product.click =>
      @increaseItemCount()
  increaseItemCount: () -> 
    # @amounts[@id] ||= 0
    # @amounts[@id] += 1    
    @amount += 1

class Icon extends Product
  constructor: (product) ->
    # super(product)
    @setHash index for index in [0..9]  
    # @setEvents()
  host: "https://s3.eu-central-1.amazonaws.com/sprachspiel/"
  numbers: ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten"]
  sequence: {}
  setHash: (index) -> @sequence[index + 1] = @numbers[index]
  changeIcon: ->
    # @increaseItemCount()
    # newlink = @host + @sequence[@amounts[@id]] + ".svg"
    # @icon.attr("src", newlink)
    # @icon.removeClass('hidden')