FactoryBot.define do
  factory :property do
    name { Property::NAMES[Random.rand(4)] }
    amount {Faker::Number.number(3)}
    # factory :attack do 
    #   name 'Angriff'
    # end
  end
end
