FactoryBot.define do
	factory :purchase do
		user
		price { Faker::Number.number(2) }

    factory :purchase_with_items do
      transient do 
        items_count 5
      end

      after(:create) do |purchase, evaluator| 
        create_list(:item, evaluator.items_count, purchase: purchase)
      end
    end
	end
end
