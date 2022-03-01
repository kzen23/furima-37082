class OrderAddress
  include ActiveModel::Model
attr_accessor :postal_code, :prefecture_id, :city, :addresses, :building_name, :phone_number, :order_id, :item_id, :user_id, :token

  with_options presence: true do
    validates :token
    validates :postal_code
    validates :city
    validates :addresses
    validates :phone_number
    validates :user_id
    validates :item_id
  end
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'is invalid.Enter it as follows (e.g. 123-4567)'}
  validates :phone_number, format: { with: /\A0\d{9,10}\z/, message: 'is too short'}
  validates :phone_number, numericality: { only_integer: true, message: 'is invalid. Input only number'}

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
