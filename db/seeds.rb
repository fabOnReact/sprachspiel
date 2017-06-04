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


