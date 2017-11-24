class Product < ApplicationRecord
  CATEGORIES = ["Legumes", "Frutas", "Bebidas" , "Verduras" , "Queijos" , "Ovos e Leite"]
  belongs_to :store
  has_attachments :photos, maximum: 10
  validates_inclusion_of :category, in: CATEGORIES
end
