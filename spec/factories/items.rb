FactoryBot.define do
  factory :item do
    product
    purchase
    user
    sold { false }
    used { false }

    factory :ironsword do 
      association :product, factory: :sword
    end
  end
end
  
