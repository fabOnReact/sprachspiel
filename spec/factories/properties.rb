FactoryBot.define do
  factory :property do
    name { Property::NAMES[Random.rand(4)] }
    amount {Faker::Number.number(3)}
  end
end
