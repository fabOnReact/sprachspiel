$(document).on 'turbolinks:load', ->
  new Purchase()
  
class Purchase
  constructor: () -> 
    @submit = $('#submit')
    @products = $.map $('[data-name=product]'), (product, i) -> 
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
        error: (data, textStatus, errorThrown) ->
          # console.log "AJAX Error: #{textStatus}"
          # console.log jqXHR.responseJSON.error
          console.log textStatus
          console.log errorThrown
          new Message data.responseJSON.error, data.css_class
        success: (data, textStatus, jqXHR) ->
          console.log textStatus
          console.log data
          console.log jqXHR
          console.log data.css_class
          new Message data.flash["notice"], data.css_class
          # window.location.href = data.location          

class Message
  constructor: (@errors, css) ->
    # if xhr
    # @errors = jqXHR.responseJSON.error 
    @css = "in alert-" + css
    @div = $('ul#errors')
    @renderErrors()
  renderErrors: ->
    for message of @errors
      @authenticationError(message) if @errors[message] == "User must exist"
      @renderMessage(message)
    @div.removeClass('out').addClass(@css)
  authenticationError:(message) -> 
    @errors[message] = "You need to log in to perform this action"
  renderMessage:(message) ->
    @div.append '<li>' + @errors[message] + '</li>'

class Product
  @items: []
  @host: "https://s3.eu-central-1.amazonaws.com/sprachspiel/"
  @numbers: ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten"]
  constructor: (product) ->
    @product = $(product)
    @id = @product.data("id")
    @icon = @product.find('[data-name=icon]')
    data_name = "[data-name=description-#{@id}]"
    @description = $(data_name)
    # @text = @product.children('[data-name=description]').html()
    @amount ||= 0
    @sequence = {}
    @setHash index for index in [0..9]
    @setEvent()
  setEvent: =>
    @product.click =>
      @increaseItemCount()
      @changeIcon() 
      Product.items.push new Item(@id)  
    @product.mouseenter =>
      @showDescription()
    @product.mouseleave =>
      @hideDescription()
    # @product.hover 
    #  -> @showDescription(), 
    #  -> @hideDescription()
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
  showDescription: ->
    @description.show()
  hideDescription: ->
    @description.hide()
  @serialize: =>
    purchase:
      price: Product.getPrice()
      items_attributes: (item.serialize() for item in Product.items)    

class Item
  constructor: (@product_id)->
  serialize: => 
    product_id: @product_id.toString()
