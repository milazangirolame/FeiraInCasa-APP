class Product < ApplicationRecord
  belongs_to :store
  has_attachments :photos, maximum: 10
end
