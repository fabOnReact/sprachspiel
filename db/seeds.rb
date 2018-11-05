# Creating products and properties with the images present in the pipeline
products = {"sichel" => [:Energie, 10],"hammer" => [:Energie, 20],"achse" => [:Angriff, 20],"messer" => [:Angriff, 10],"fisch" => [:Gesundheit, 20],"bank" => [:Energie, 30],"ofen" => [:Energie, 10],"hähnchen" => [:Energie, 20],"schwert" => [:Angriff, 35],"schild" => [:Verteidigung, 20],"brot"=> [:Energie, 30]}
products.keys.map do |key|
	property = Property.find_or_create_by(name: products[key][0], amount: products[key][1] )
	product = Product.find_or_create_by(name: key, property: property)
    puts "product #{product.name} has the following errors #{product.errors.full_messages}" if product.errors.present?
end
# Creating Roles 
farmer = Role.create(name: "Farmer")
Role.create(name: "Schmied")
soldier = Role.create(name: "Soldat")
Role.create(name: "König")
# Creating User
user1 = User.create(email: 'fabrizio@email.com', password: 'fabrizio', username: 'fabrizio', role: soldier)
puts "user1 errors #{user1.errors.full_messages}"
user2 = User.create(email: 'ezio@email.com', password: 'fabrizio', username: 'ezio', role: farmer)
# Creating some basic messages
contents = ["Hello, welcome to our new application", "Here you can exercise your german speaking skills with other students", "The game is fun!", "Many new feature will come out soon!"]
chatroom = Chatroom.create()
contents.each_with_index do |content, index|
  user = index.odd? ? user1 : user2
  message = Message.create(user: user, chatroom: chatroom, content: content)
  puts "the messages errors are #{message.errors.full_messages}" if message.errors.present?
  puts "the user is #{user.inspect}"
end
