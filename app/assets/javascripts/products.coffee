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
  increaseItemCount: () -> 
    @amount += 1
  setHash: (index) -> @sequence[index + 1] = Product.numbers[index]
  changeIcon: ->
    newlink = Product.host + @sequence[@amount] + ".svg"
    @icon.attr("src", newlink)
    @icon.removeClass('hidden')
  @getPrice: ->
    priceButton = $('[data-id=price-amount]')
    parseInt(priceButton.html())
  showDescription: ->
    @description.show()
  hideDescription: ->
    @description.hide()
  @serialize: =>
    purchase:
      price: Product.getPrice()
      items_attributes: (item.serialize() for item in Product.items)    

window.Product = Product