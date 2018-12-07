FactoryBot.define do
   factory :description do
      building
      
      factory :title do 
         name { 'room-title' }
         content { 'Bauernhof' }
      end

      factory :roomdescription do
         name { 'room-description' }
         content { 'an example of description for this building' }
      end
   end
end
