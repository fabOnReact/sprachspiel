# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create Roles

Role.create(name: "Farmer")
Role.create(name: "Schmied")
Role.create(name: "Soldat")
Role.create(name: "König")

# Create Buildings

price = Price.create(gold: 10, wood: 10, food: 10, stone: 10, metal: 10)
Building.create(name: "Landwirtschaft", price_id: price.id, role_id: 1)

price = Price.create(gold: 20, wood: 0, food: 10, stone: 40, metal: 10)
Building.create(name: "Schmied", price_id: price.id, role_id: 2)

price = Price.create(gold: 20, wood: 10, food: 10, stone: 0, metal: 40)
Building.create(name: "Armee", price_id: price.id, role_id: 3)

price = Price.create(gold: 60, wood: 30, food: 10, stone: 50, metal: 50)
Building.create(name: "Palast", price_id: price.id, role_id: 4)

# Changing Description of buildings 

descriptions = ["Im Landwirtschaft kann man Lebensmittel kaufen, die jeden Spieler einen Energiebonus geben werden. Jeder Spieler in Sprachspiel muss essen, Soldaten, Königen, Schmiede haben einen höhere Energiebedarf", "Im Schmied kann man Schwerter, Waffen, Rüstung, Werkzeuge, Maschinen kaufen... Diese Objekte werden dem Spieler einen Bonus geben, der ihnen einen Vorteil im Kampf, in produktiven Tätigkeiten und in vielen anderen Dingen geben werden..", "In der Baracke kann man Soldaten rekrutieren zu kämpfen, um Verbrechen anzuprangern, um sich selbst zu verteigigen... Der König muss ihre Soldaten unterstützen um die Macht zu behalten. Die Soldaten brauchen Nahrung und Waffen.", "Jedes Dorf muss die Armee halten und versorgen, so kann er die Zahlung der Steuern vom Volk verlangen. Ein König kann für eine Woche oder einen Monat gewählt werden und viel Geld verdienen ! Ein König kann ein anderes Dorf mit seiner Armee siegen, aber er kann auch getötet werden."]
i = 0
Building.all.each do |building|
	building.description = descriptions[i]
	# Adding Chatroom to Chat
	building.chatroom = Chatroom.new
	building.role_id = i+1
	building.save
	i += 1
end

# Create Productstype

Producttype.create(name: "Werkzeuge")
Producttype.create(name: "Waffen")
Producttype.create(name: "Lebensmittel")

# Create Products

price = Price.create(gold: 0, wood: 10, food: 0, stone: 0, metal: 5)
product = Product.create(name: :sichel, building_id: 2, producttype_id: 1, price_id: price.id, bonus: true)

price = Price.create(gold: 0, wood: 10, food: 0, stone: 0, metal: 5)
product = Product.create(name: :hammer, building_id: 2, producttype_id: 1, price_id: price.id, bonus: true)

price = Price.create(gold: 0, wood: 15, food: 0, stone: 0, metal: 15)
product = Product.create(name: :schwert, building_id: 3, producttype_id: 2, price_id: price.id, bonus: false)

price = Price.create(gold: 0, wood: 0, food: 10, stone: 0, metal: 0)
product = Product.create(name: :brot, building_id: 1, producttype_id: 3, price_id: price.id, bonus: true)

price = Price.create(gold: 0, wood: 10, food: 0, stone: 0, metal: 10)
product = Product.create(name: :achse, building_id: 2, producttype_id: 1, price_id: price.id, bonus: false)

price = Price.create(gold: 0, wood: 10, food: 0, stone: 0, metal: 15)
product = Product.create(name: :messer, building_id: 2, producttype_id: 1, price_id: price.id, bonus: false)

price = Price.create(gold: 0, wood: 10, food: 30, stone: 0, metal: 0)
product = Product.create(name: :fisch, building_id: 1, producttype_id: 3, price_id: price.id, bonus: false)

price = Price.create(gold: 0, wood: 50, food: 30, stone: 10, metal: 0)
product = Product.create(name: :bank, building_id: 2, producttype_id: 1, price_id: price.id, bonus: false)

price = Price.create(gold: 5, wood: 10, food: 10, stone: 50, metal: 10)
product = Product.create(name: :ofen, building_id: 2, producttype_id: 1, price_id: price.id, bonus: false)

price = Price.create(gold: 0, wood: 10, food: 50, stone: 0, metal: 0)
product = Product.create(name: :hähnchen, building_id: 1, producttype_id: 3, price_id: price.id, bonus: false)

price = Price.create(gold: 10, wood: 0, food: 0, stone: 0, metal: 70)
product = Product.create(name: :schild, building_id: 2, producttype_id: 2, price_id: price.id, bonus: false)


requirements = [[:sichel, :hammer], [:hammer, :brot], [:schwert, :hammer], [:brot, :sichel], [:achse, :hammer], [:messer, :brot], [:fisch, :messer], [:bank, :hammer], [:ofen, :bank], [:hähnchen, :ofen], [:schild, :hähnchen]]

requirements.each do |requirement|
	product = Product.find_by(name: requirement[0])
	object = Product.find_by(name: requirement[1])
	product.requirement_id = object.id
	product.save 
end

# Descriptions

Description.create(name: "room-title", content: "Bauernhof", building_id: 1)
Description.create(name: "room-title", content: "Schmied", building_id: 2)
Description.create(name: "room-title", content: "Armee", building_id: 3)
Description.create(name: "room-description", content: "Jeder Spieler kann Lebensmittel im Bauernhof kaufen, mit dieser kann er einen Vorteil in vielen verschiedenen Bereichen gewinnen. Mit der Ankauft von Brot, Salami, Tomaten und Spinat wird man eine höhere Punktzahl für den Kampf, für die Landwirtschaft und die Produktion von Objekten bekommen.", building_id: 1)
Description.create(name: "room-description", content: "Hier können sie Schwerter, Rüstung, Werkzeuge, Hämmer und viele anderen Objekten kaufen. Soldaten können Schwerter, Rüstung, Bögen und Pfeile kaufen um eine Vorteile im Kampf zu bekommen, während Schmiede, Farmer einige Werkzeuge wie Hämmer, Schaufeln, Mahlstein brauchen um Produkte wie Brot, Schwert, Lebensmittel zu erstellen.", building_id: 2)
Description.create(name: "room-description", content: "In der Armee können Spieler Soldaten anwerben, die für eine Faktion kämpfen können oder die Sicherheit einem Geschäft gegen die Diebstähle gewährleisten können.. Im SprachSpiel können Spieler   stehlen, deshalb ist die Organisation der Bürgersicherheit notwendig.", building_id: 3)





















# Other Test Cases

#building = Building.first
#first_user = User.find(3)
#room = Room.create(title: "Geschäft" , description: "Hallo, mein Name ist Fabrizio Bertoglio, ich habe SprachSpiel von einigen Tagen entwickelt und hier möchte ich Lebensmittel, Weizen und andere typischen Produkte verkaufen... Ich kann Ihnen einen guten Deal anbieten, deshalb kontaktieren Sie mich und ich werde Sie nicht enttäuschen Viele Grüße Fabrizio", user_id: first_user.id, building_id: building.id)

#second_user = User.new(email: "federico@email.com", password: "fabrizio")
#second_user.password_confirmation = "fabrizio"
#second_user.save
# Creating a second User
#second_user = User.find(4)

=begin
product = Product.first
item = Item.create(product_id: product.id, sold: false, used: false)

price = Price.create(gold: 10, food: 40)
purchase = Purchase.create(user_id: first_user.id, item_id: item.id, room_id: first_user.rooms.first, price_id: price.id)
item.sold = true
item.save
#sale = Sale.create(user_id: second_user.id, item_id: item.id, )
#invoice = Invoice.create(purchase_id: purchase.id, sale_id: sale.id, price_id: price.id)
=end