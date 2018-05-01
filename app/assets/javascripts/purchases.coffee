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
          messages = Purchase.convertString(data.responseJSON)
          css = data.responseJSON.css_class
          new Message messages, css, false
        success: (data, textStatus, jqXHR) ->
          messages = Purchase.convertString(data.responseJSON)
          css = data.responseJSON.css_class
          new Message messages, css, true
          window.location.href = data.location     
  @convertString: (json) ->
    message = switch
      when typeof json["error"] == 'string' then [ json["error"] ]
      when json["error"] != undefined then json["error"]
      when json["notice"] != undefined then json["notice"]

class Message
  constructor: (@errors, css, @alert) ->
    @css = "in alert-" + css
    @div = $('ul#errors')
    if @alert 
      @renderAlert()
    else
      @renderErrors()
  renderAlert: -> 
    alert(@errors.toString())
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
    @amount ||= 0
    @sequence = {}
    @setHash index for index in [0..9]
    @setEvent()
  setEvent: =>
    @product.click =>
      @increaseItemCount()
      @changeIcon() 
      Product.items.push new Item(@id)  
    # @product.mouseenter =>
    #   @showDescription()
    # @product.mouseleave =>
    #   @hideDescription()
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
