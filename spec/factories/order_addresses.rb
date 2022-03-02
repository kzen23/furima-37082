FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    prefecture_id { Faker::Number.within(range: 1..47) }
    city { '北海道' }
    addresses { 'テスト1-1' }
    building_name { 'テスト北海道' }
    phone_number { '09012345678' }
    token { 'tok_abcdefg00000000000' }
  end
end
