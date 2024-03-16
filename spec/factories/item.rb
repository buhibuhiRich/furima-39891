FactoryBot.define do
  factory :item do
    association :user, factory: :user
    name { "靴" }
    description { "テスト" }
    category_id { 2 }
    condition_id { 2 }
    shipping_cost_responsibility_id { 2 }
    shipping_from_region_id { 2 }
    days_until_shipment_id { 2 }
    price { 1000 }
    
    after(:build) do |item|
      item.image.attach(io: File.open(Rails.root.join('bin', 'public', 'images', 'test_image.png')), filename: 'test_image.png')
    end
  end
end
