FactoryBot.define do
  factory :room do
    title "MyString"
    description "MyText"
    building
    user
  end
end
