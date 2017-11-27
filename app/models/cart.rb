class Cart < ApplicationRecord
  has_many :items
  has_many :products, through: :items
  belongs_to :user
  validates :delivery_address, :delivery_city, :delivery_zipcode, :payment_method, presence: true
end
