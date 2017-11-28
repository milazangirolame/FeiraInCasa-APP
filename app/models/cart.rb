class Cart < ApplicationRecord
  has_many :items
  has_many :products, through: :items
  belongs_to :user
end
