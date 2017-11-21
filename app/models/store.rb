class Store < ApplicationRecord
  belongs_to :user
  has_many :products
  serialize :days_of_week_opened, Array
end
