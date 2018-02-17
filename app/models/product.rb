class Product < ApplicationRecord
  CATEGORIES = ["Legumes", "Frutas", "Bebidas" , "Verduras" , "Queijos" , "Ovos e Leite"]

  acts_as_paranoid
  monetize :price_centavos
  belongs_to :store
  has_many :items
  has_attachments :photos, maximum: 1
  validates_inclusion_of :category, in: CATEGORIES
  validates :name, :category, :price, :unity, presence: true
  validates :name, uniqueness: { scope: [:store_id]}
  validates :photos, presence: true



  def item_for(user)
    user.current_cart.items.find_by(product: self) || Item.new(quantity: 0, product: self, cart: user.current_cart)
  end


end
