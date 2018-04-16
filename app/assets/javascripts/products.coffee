$(document).on 'turbolinks:load', ->
  new Purchase()

class Purchase
  constructor: () -> 
    @submit = $('#submit')
    @products = $.map $('.product-partial'), (product, i) -> 
      new Product(product)
    @setEvents()      
  setEvents: ->
    @submit.click => 
      @createPurchase()
  getRow: (i, product) -> 
    unless product.amount == 0
      "product_id": product.id
      "amount": product.amount
  aggregateData: ->
    @getRow i+1, product for product, i in @products
  createPurchase: -> 
    data = @aggregateData().filter (n) -> n != undefined
    console.log(data)
    @postPurchase(data)
  postPurchase: (data) ->
    $.ajax
       url: "/purchases"
       method: "POST"
       dataType: "json"
       data: {"purchase": {"items_attributes": data }} 
       error: (jqXHR, textStatus, errorThrown) ->
         console.log "AJAX Error: #{textStatus}"
       success: (data, textStatus, jqXHR) ->
         console.log "Successful AJAX call: #{data}"
         console.log data

class Product
  constructor: (product) ->
    @product = $(product)
    @id = @product.data("id")
    @icon = @product.find('img[data-name=icon]')
    @setEvent()
    @amount ||= 0
    @setHash index for index in [0..9] 
  host: "https://s3.eu-central-1.amazonaws.com/sprachspiel/"
  numbers: ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten"]
  sequence: {}  
  setEvent: ->
    @product.click =>
      @increaseItemCount()
      @changeIcon()   
  increaseItemCount: () -> 
    @amount += 1
  setHash: (index) -> @sequence[index + 1] = @numbers[index]
  changeIcon: ->
    newlink = @host + @sequence[@amount] + ".svg"
    @icon.attr("src", newlink)
    @icon.removeClass('hidden')