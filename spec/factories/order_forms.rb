FactoryBot.define do
  factory :order_form do
    postal_code { '123-4567' }
    shipping_from_region_id { 1 }
    city { '東京都' }
    street_address { '渋谷区1-2-3' }
    building_name { 'ビル名101' }
    phone_number { '09012345678' }
    token {"tok_abcdefghijk00000000000000000"}
    user
  end
end
