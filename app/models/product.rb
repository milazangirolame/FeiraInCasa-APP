class Product < ApplicationRecord
  belongs_to :store
  has_attachments :photos, maximum: 10
end

def price(float_n)
  float_n.round(3).to_s[0..3].to_f
end
