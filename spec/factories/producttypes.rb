FactoryBot.define do
   factory :producttype do
      name { Faker::Zelda.item }
      
      factory :producttype_with_products do 
         transient do
            products_count 5
         end

         after(:create) do |producttype, evaluator|
            create_list(:product, evaluator.products_count, producttype: producttype)
         end
      end

      factory :producttype_with_products_and_items do 
         transient do
            products_count 5
         end

         after(:create) do |producttype, evaluator|
            create_list(:product_with_items, evaluator.products_count, producttype: producttype)
         end
      end

      factory :tool do
         name "Werkzeuge"
      end   

      factory :weapon do
         name "Waffen"
      end   

      factory :food do
         name "lebensmittel"
      end       
   end  
end
