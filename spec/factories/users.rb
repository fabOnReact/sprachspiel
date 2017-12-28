FactoryBot.define do
  factory :user do
	email { Faker::Internet.email }
	password { Faker::Internet.password }
	username { Faker::Internet.user_name }
	role    
	
	factory :user_with_purchases  do 
		transient do
			purchases_count 5
		end

		after(:create) do |user, evaluator|
			create_list(:purchase, evaluator.purchases_count, user: user)
		end
	end

	factory :user_with_sales  do 
		transient do
			sales_count 5
		end

		after(:create) do |user, evaluator|
			create_list(:sale, evaluator.sales_count, user: user)
		end
	end	
  end
end