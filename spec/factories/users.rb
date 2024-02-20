FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'00000ab'}
    password_confirmation {password}
    first_name            {'山'}  
    last_name             {'太郎'} 
    first_name_kana       {'ヤマ'}
    last_name_kana        {'タロウ'}
    birth_date           { Date.new(2000, 1, 1) }
  end
end
