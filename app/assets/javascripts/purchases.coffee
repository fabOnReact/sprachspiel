$(document).on 'turbolinks:load', ->
  new Purchase()
  
class Purchase
  constructor: -> 
    @submit = $('#submit')
    @chatroom = $('[data-name=scroll-bar]')
    @products = $.map $('[data-name=product]'), (product, i) -> 
      new window.Product(product)
    @onSubmit()
    @onAction()
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
  onAction: -> 
    $('[data-name=show-actions]').click => 
      @chatroom.hide()  
  @convertString: (json) ->
    message = switch
      when typeof json["error"] == 'string' then [ json["error"] ]
      when json["error"] != undefined then json["error"]
      when json["notice"] != undefined then json["notice"]