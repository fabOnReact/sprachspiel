$(document).on 'turbolinks:load', ->
  new Purchase()

class Purchase
  constructor: () -> 
    @submit = $('#submit')
    @products = $.map $('.product-partial'), (product, i) -> 
      new Product(product)
    # @setEvents()    
  # data: {}
  # array: []  
  # # setEvents: ->
  #   @submit.click => 
  #     @createPurchase()
  # getRow: (product) -> 
  #   i = 0
  #   while i < product.amount
  #     i++ 
  #     "product_id": product.id
  # aggregateData: ->
  #   @getRow product for product in @products
  # cleanData: -> 
  #   @data = @aggregateData().filter (n) -> n.length != 0
  #   # @data = [].concat([], @data)
  #   @data = JSON.stringify(@data).replace(/\]|\[/g, "")
  #   @data = @data
  #   console.log @data
  # createPurchase: -> 
  #   @cleanData()
  #   # console.log @data
  #   # console.log @data
  #   @postPurchase()
  # postPurchase: (data) ->
  #   $.ajax
  #      url: "/purchases"
  #      method: "POST"
  #      dataType: "json"
  #      data: @data
  #      error: (jqXHR, textStatus, errorThrown) ->
  #        console.log "AJAX Error: #{textStatus}"
  #      success: (data, textStatus, jqXHR) ->
  #        console.log "Successful AJAX call"

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