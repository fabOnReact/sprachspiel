# Create Roles

Role.create(name: "Farmer")
Role.create(name: "Schmied")
Role.create(name: "Soldat")
Role.create(name: "König")

# Create Productstype

Category.create(name: "Werkzeuge")
Category.create(name: "Waffen")
Category.create(name: "Lebensmittel")

# Requirements 

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

# Set prices for Products
PRODUCTS = {'sichel' => 10,'schwert' => 50,'achse' => 20,'bank' => 5,"hammer" => 10,'brot' => 5,'messer' => 10,'fisch' => 10,'ofen' => 25,'hähnchen' => 10,'schild' => 100, 'fisch' => 20, 'steak' => 25}

Product.all.each do |product|
	product.price = PRODUCTS[product.name]
	product.save
end

# Products Descriptions

descriptions = ["sickle will allow you ability to make food", "hammer is a tool useful for building items", "sword will make you strong in fight", "bread will give you energy to work", "the axis is great for close-quarters", "use this blade to cut the meat", "fish gives you energy to work", "a bench is required to build complex tools", "furnace let you prepare food and raw materials", "more meat more energy", "defence is as much important as offence"]
i = 0
Product.all.each do |product|
	product.description = descriptions[i]
	# Description.create(product: product, name: "purpose",content: descriptions[i])
	product.save
	i += 1
end

# Guest User

guest_user = User.create(email: 'guest@email.com', username: 'guest', password: 'fabri2787', password_confirmation: 'fabri2787', role: Role.first) 

# Alliances

# current_user = User.where(email: 'fabrizio.bertoglio@gmail.com')
# other_user = User.new(email: 'test@email.com', username: 'Paul', role_id: 1, password: 'fabri2787', password_confirmation: 'fabri2787')

# current_user = User.where(email: 'fabrizio.bertoglio@gmail.com')
# other_user = User.where(email: 'test@email.com')

# alliance = Alliance.new(name: 'kings of the South', description: 'joined in our defensive strategy')
# alliance.users << [current_user, other_user]
# alliance.save

# trade = Trade.new(name: 'the Asia route', description: 'exchange resources and make profits')
# trade.users << [current_user, other_user]
# trade.save

# building = Building.new(name: 'Baracke', description: 'Infanterie')
# building.users << [current_user, other_user]
# buidling.save

# fight = Fight.new(name: 'War: Conquer Aristotele', description: 'trying to conquer the next village')
# fight.users << [current_user, other_user]
# fight.save

# attack = Property.new(name: 'Angriff', amount: 10)
# product = Product.find_by(name: 'schwert')
# product.update_attributes(property: attack)

# defense = Property.new(name: 'Verteidigung', amount: 5)
# product = Product.find_by(name: 'schild')
# product.update_attributes(property: defense)

# energy = Property.new(name: 'Energie', amount: 15)
# product = Product.find_by(name: 'brot')
# product.update_attributes(property: energy)

# health = Property.new(name: 'Gesundheit', amount: 10)

products = {"sichel" => [:Energie, 10],"hammer" => [:Energie, 20],"achse" => [:Angriff, 20],"messer" => [:Angriff, 10],"fisch" => [:Gesundheit, 20],"bank" => [:Energie, 30],"ofen" => [:Energie, 10],"hähnchen" => [:Energie, 20],"schwert" => [:Angriff, 35],"schild" => [:Verteidigung, 20],"brot"=> [:Energie, 30]}
products.keys.map do |key|
	product = Product.find_by(name: key)
	property = Property.create(name: products[key][0], amount: products[key][1] )
	product.update_attributes(property: property)
end