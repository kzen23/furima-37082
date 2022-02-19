FactoryBot.define do
  factory :user do
    nickname { 'Furima坊や' }
    email { Faker::Internet.free_email }
    password = Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1)
    password { password }
    password_confirmation { password }
    last_name { '付利マ' }
    first_name { '坊や' }
    last_name_kana { 'フリマ' }
    first_name_kana { 'ボウヤ' }
    birth_date { '1978-06-30' }
  end
end
