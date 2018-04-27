FactoryBot.define do
   factory :role do
      name "MyString"
      
      factory :role_with_descriptions do 
         name 'My custom role'
      #    # association :building, factory: :building_with_associations
      end
   end
end
