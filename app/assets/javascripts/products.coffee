$(document).on 'turbolinks:load', ->
  new Purchase

class Purchase
  constructor: -> 
    @submit = $('#submit')
    @setEvents()
    products = $.map $('.product-partial'), (product, i) -> 
      new Icon(product)
  setEvents: ->
    @submit.click => 
      @createPurchase()  
      # console.log('test')
  createPurchase: -> 
    $.ajax
       url: "/products"
       method: "POST"
       dataType: "json"
       data: { items: {product_id: '1', name: 'test' }}
       error: (jqXHR, textStatus, errorThrown) ->
         console.log "AJAX Error: #{textStatus}"
       success: (data, textStatus, jqXHR) ->
         console.log "Successful AJAX call: #{data}"
         console.log data

# $.ajax
#    url: "some.html"
#    dataType: "html"
#    error: (jqXHR, textStatus, errorThrown) ->
#      $('body').append "AJAX Error: #{textStatus}"
#    success: (data, textStatus, jqXHR) ->
#      $('body').append "Successful AJAX call: #{data}"

# $.ajax({
#     url: "/sub_comments",
#     type: "POST",
#     data: {subcomment: {
#              field: val, 
#              field2: val, etc... }},
#     success: function(resp){ }
# });

class Product
  constructor: (product) ->
    @product = $(product)
    @id = @product.data("id")
    @icon = @product.find('img[data-name=icon]')
  amounts: {}
  setEvents: ->
    @product.click => 
      @changeIcon()   
  increaseItemCount: (id) -> 
    @amounts[@id] ||= 0
    @amounts[@id] += 1    

class Icon extends Product
  constructor: (product) ->
    super(product)
    @setHash index for index in [0..9]  
    @setEvents()
  host: "https://s3.eu-central-1.amazonaws.com/sprachspiel/"
  numbers: ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten"]
  sequence: {}
  setHash: (index) -> @sequence[index + 1] = @numbers[index]
  changeIcon: ->
    @increaseItemCount()
    newlink = @host + @sequence[@amounts[@id]] + ".svg"
    @icon.attr("src", newlink)
    @icon.removeClass('hidden')

