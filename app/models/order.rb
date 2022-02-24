class Order < ApplicationRecord
  has_many :addresses
  belongs_to :item
end
