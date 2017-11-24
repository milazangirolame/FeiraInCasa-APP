class Item < ApplicationRecord
  belongs_to :cart
  belongs_to :product
  validates_presence_of :cart, :product
  validates_numericality_of :quantity, greater_than_or_equal_to: 0
end
