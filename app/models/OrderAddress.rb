class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :addresses, :building_name, :phone_number, :order_id, :user_id, :item_id

  with_options presence: true do
    validates :postal_code
    validates :city
    validates :addresses
    validates :phone_number
    validates :order_id
    validates :user_id
    validates :item_id
  end
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'is invalid.Enter it as follows (e.g. 123-4567)'}
  validates :phone_number, numericality: { greater_than_or_equal_to: 10, less_than_or_equal_to: 11, message: 'is too short'}
  validates :phone_number, numericality: { only_integer: true, message: 'is invalid. Input only number'}

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses, building_name: building_name, phone_number: phone_number, order_id: order.id)
end