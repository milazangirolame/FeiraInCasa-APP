class Cart < ApplicationRecord
  monetize :amount_centavos
  has_many :items
  has_many :products, through: :items
  belongs_to :user

  def calculate_amount
    update!(amount: items.map {|item| item.total}.sum)
  end
end
