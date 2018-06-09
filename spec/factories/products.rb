FactoryBot.define do
   factory :product do
      name { Faker::Zelda.item }
      property
      # price
      # building
      # category
      # bonus { Faker::Boolean.boolean}

	   factory :hammer do 
	   	name 'hammer'
	   	# price
	   	# building
	   	# category
	   	# bonus { Faker::Boolean.boolean }
	   end

      # factory :product_with_items do 
      #    transient do 
      #       items_count 5
      #    end

      #    after(:create) do |product, evaluator|
      #       create_list(:item, evaluator.items_count, product: product)
      #    end
      # end
   end
end