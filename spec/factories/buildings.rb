FactoryBot.define do
   factory :building do
      name "Landwirtschaft"
      
      factory :blacksmith do 
         name "Schmied"
      end

      factory :army do
         name 'Armee'
      end

      factory :palace do
         name 'Palast'
      end

      factory :building_with_associations do

         transient do 
            products_count 5
         end

         after(:create) do |building, evaluator|
            [:title, :roomdescription].map { |type| create_list(type, 1, building: building) }
            create_list(:product, evaluator.products_count, building: building)
         end
      end

      factory :building_with_items do 
      	transient do 
      		products_count 5
      	end
      		
   		after(:create) do |building, evaluator|
   			create_list(:product_with_items, evaluator.products_count, building: building)
   		end
   	end
   end
end