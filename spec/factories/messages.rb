FactoryBot.define do
  factory :message do
    content "MyText"
    user_id 1
    chatroom
  end
end
