  FactoryBot.define do
    factory :product do
      name { Product::PRODUCTS.keys.sample }
      property
      price { Faker::Number.number(2) }

    factory :sword do 
      name 'sword'
      price 50
      association :property, name: 'Angriff'
    end

    factory :hammer do 
      name 'hammer'
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
