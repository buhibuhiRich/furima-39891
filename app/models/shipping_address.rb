class ShippingAddress < ApplicationRecord
  belongs_to :order

  validates :postal_code, presence: true, format: { with: /\A\d{3}[-]\d{4}\z/ }
  validates :shipping_from_region_id, presence: true
  validates :city, presence: true
  validates :street_address, presence: true
  validates :building_name, presence: true
  validates :phone_number, presence: true
end

