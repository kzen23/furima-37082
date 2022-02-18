FactoryBot.define do
  factory :item do
    name {"テスト"}
    info {"これはテストです。"}
    price {Faker::Number.within(range: 300..9999999)}
    id_num = Faker::Number.within(range: 2..3)
    category_id {id_num}
    sales_status_id {id_num}
    shipping_fee_status_id {id_num}
    scheduled_delivery_id {id_num}
    prefecture_id {Faker::Number.within(range: 1..47)}
    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
