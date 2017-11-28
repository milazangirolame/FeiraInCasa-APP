class Product < ApplicationRecord
  CATEGORIES = ["Legumes", "Frutas", "Bebidas" , "Verduras" , "Queijos" , "Ovos e Leite"]
  belongs_to :store
  has_many :items
  has_attachments :photos, maximum: 10
  validates_inclusion_of :category, in: CATEGORIES
  validates :name, :category, :price, :unity, presence: true

  def item_for(user)
    user.current_cart.items.find_by(product: self) || Item.new(quantity: 0, product: self, cart: user.current_cart)
  end


end
