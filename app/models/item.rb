class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :sales_status, :shipping_fee_status, :prefecture, :scheduled_delivery

  with_options presence: true do
    :name
    :info
    :image
  end

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    :categroy_id
    :sales_status
    :shipping_fee_status
    :scheduled_delivery
  end

  validates :prefecture, numericality: { other_than: 0, message: "can't be blank"}
  validates :price, numericality: { :only_integer: true, greater_than_or_equal: 300, less_than_or_equal_to: 9999999, message: "is invalid" }
end
