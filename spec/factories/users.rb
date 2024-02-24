FactoryBot.define do
  factory :user do  
    nickname              { 'test' }
    email                 { Faker::Internet.email }
    password              { '00000ab' }
    password_confirmation { '00000ab' }
    first_name            { '山田' }
    last_name             { '太郎' }
    first_name_kana       { 'ヤマダ' }
    last_name_kana        { 'タロウ' }
    birth_date            { '1990-01-01' }
  end
end
