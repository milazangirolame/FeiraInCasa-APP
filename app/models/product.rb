class Product < ApplicationRecord
  belongs_to :store
  has_many :items
  has_attachments :photos, maximum: 10
end
