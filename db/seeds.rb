products = {"sichel" => [:Energie, 10],"hammer" => [:Energie, 20],"achse" => [:Angriff, 20],"messer" => [:Angriff, 10],"fisch" => [:Gesundheit, 20],"bank" => [:Energie, 30],"ofen" => [:Energie, 10],"hähnchen" => [:Energie, 20],"schwert" => [:Angriff, 35],"schild" => [:Verteidigung, 20],"brot"=> [:Energie, 30]}
products.keys.map do |key|
	property = Property.find_or_create_by(name: products[key][0], amount: products[key][1] )
	product = Product.find_or_create_by(name: key)
    # product.update_attributes(property: property)
    puts property.errors.full_messages if property.errors
	puts product.errors.full_messages if product.errors
end
