# Creating products and properties with the images present in the pipeline
# attributes for properties
properties = [{name: :Energie, amount: 10}, {name: :Energie, amount: 20}, {name: :Angriff, amount: 20}, {name: :Angriff, amount: 10}, {name: :Gesundheit, amount: 20}, {name: :Energie, amount: 30}, {name: :Angriff, amount: 35},  {name: :Verteidigung, amount: 20}]
# attributes for products
products = [{name: :sichel, price: 10, property_id: 1},{name: :hammer, price: 20, property_id: 2}, {name: :achse, price: 30, property_id: 3}, {name: :messer, price: 40, property_id: 4}, {name: :fisch, price: 10, property_id: 5}, {name: :bank, price: 15, property_id: 6}, {name: :ofen, price: 15, property_id: 1}, {name: :hähnchen, price: 10, property_id: 2}, {name: :schwert, price: 40, property_id: 7}, {name: :schild, price: 50, property_id: 8}, {name: :brot, price: 10, property_id: 6}  ]
puts "1 ----- creating properties"
properties.each_with_index do |attributes, index|
  property = Property.find_or_create_by attributes
  LogMessage.new property, index
end
   
puts "2 ----- creatings products"
products.each_with_index do |attributes, index|
  product = Product.find_or_create_by attributes
  LogMessage.new product, index
end

puts "3 ----- creating roles"
farmer = Role.create(name: "Farmer")
schmied = Role.create(name: "Schmied")
soldier = Role.create(name: "Soldat")
konig = Role.create(name: "König")
LogMessage.new farmer, 1
LogMessage.new schmied, 2
LogMessage.new soldier, 2
LogMessage.new konig, 2

puts "4 ----- creating users"
user1 = User.create(email: 'fabrizio@email.com', password: 'fabrizio', username: 'fabrizio', role: soldier)
LogMessage.new user1, 1 
user2 = User.create(email: 'ezio@email.com', password: 'fabrizio', username: 'ezio', role: farmer)
LogMessage.new user2, 2
user3 = User.create(email: 'guest@email.com', password: 'guestuser', username: 'guest')
LogMessage.new user3, 3

puts "5 ----- creating chatroom messages"
contents = ["Hello, welcome to our new application", "Here you can exercise your german speaking skills with other students", "The game is fun!", "Many new feature will come out soon!"]
chatroom = Chatroom.create()
LogMessage.new chatroom, 1
contents.each_with_index do |content, index|
  user = index.odd? ? user1 : user2
  message = Message.create(user: user, chatroom: chatroom, content: content)
  LogMessage.new message, index
end

puts "6 ----- creating purchases" 
products = Product.where("id < ?", 3)
User.all.each_with_index do |user, index|
  purchase = Purchase.create(user: user, price: products.sum(:price))
  products.each_with_index do |product, index| 
    item = Item.create(product: product, purchase: purchase, user: user)
    LogMessage.new item, index 
  end
  LogMessage.new purchase, 1
end
  
puts "7 ----- creating events" 
alliance = Alliance.create(name: "King of the North", description: "Defensive alliance against attackers", users: User.all)
LogMessage.new alliance, 1
trade = Trade.create(name: "Route on the North", description: "exchanging wood for gold", users: User.all)
LogMessage.new trade, 2
