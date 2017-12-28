FactoryBot.define do
  factory :price do
    gold { Faker::Number.number(2)}
    wood { Faker::Number.number(2)}
    food { Faker::Number.number(2)}
    stone { Faker::Number.number(2)}
    metal { Faker::Number.number(2)}
  end
end
