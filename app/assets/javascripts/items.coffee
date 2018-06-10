class Item
  constructor: (@product_id)->
  serialize: => 
    product_id: @product_id.toString()


window.Item = Item