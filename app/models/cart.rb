class Cart < ApplicationRecord
  has_many :itens
  has_many :products, through: :itens
  belongs_to :user
end
