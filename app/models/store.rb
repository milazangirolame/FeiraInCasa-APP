class Store < ApplicationRecord
  belongs_to :user
  has_many :products
  serialize :days_of_week_opened, Array
  geocoded_by :full_address
  after_validation :geocode, if: :full_address_changed?
  validates :name, :address, :city, :zipcode, presence: true


  def full_address
    "#{self.address}, #{self.city}, #{self.zipcode}"
  end

  def full_address_changed?
    address_changed? || city_changed? || zipcode_changed?
  end
end
