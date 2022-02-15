class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :sales_status, :shipping_fee_status, :prefecture, :scheduled_delivery
end
