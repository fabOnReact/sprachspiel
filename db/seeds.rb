# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Price.create(gold: 10, wood: 10, food: 10, stone: 10, metal: 10)
Building.create(name: "Landwirtschaft", price_id: 1)

Price.create(gold: 20, wood: 0, food: 10, stone: 40, metal: 20)
Building.create(name: "Religion", price_id: 2)

Price.create(gold: 20, wood: 10, food: 10, stone: 0, metal: 40)
Building.create(name: "Armee", price_id: 3)

Price.create(gold: 60, wood: 30, food: 10, stone: 50, metal: 50)
Building.create(name: "Palast", price_id: 4)

Price.create(gold: 0, wood: 10, food: 10, stone: 0, metal: 0)
Building.create(name: "Dorf", price_id: 5)

user = User.last
room = Room.create(title: "Das bestes Geschäft" , description: "Hallo, <br> mein Name ist Fabrizio Bertoglio, ich habe SprachSpiel von einigen Tagen entwickelt und hier möchte ich Lebensmittel, Weizen und andere typischen Produkte verkaufen... Ich kann Ihnen einen guten Deal anbieten, deshalb kontaktieren Sie mich und ich werde Sie nicht enttäuschen <br>Viele Grüße <br>Fabrizio", user_id: user.id)

#second_user = User.new(email: "federico@email.com", password: "fabrizio")
#second_user.password_confirmation = "fabrizio"
#second_user.save
# Creating a second User
first_user = User.first
second_user = User.find(2)

#product = Product.first
product = Product.create(name: :sichel)
item = Item.create(product_id: product.id, sold: false, used:false, room_id: room.id)

#purchase = Purchase.create(user_id: first_user.id, item_id: item.id)
#sale = Sale.create(user_id: second_user.id, item_id: item.id)
#price = Price.create(gold: 10, food: 40)
#invoice = Invoice.create(purchase_id: purchase.id, sale_id: sale.id, price_id: price.id)
