class Store < ApplicationRecord
  belongs_to :user
  serialize :days_of_week_opened, Array
end
