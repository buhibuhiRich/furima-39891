class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :shipping_address

  validates :user, presence: true
  validates :item, presence: true

  def create_shipping_address(address_params)
    shipping_address = build_shipping_address(address_params)
    shipping_address.save
    shipping_address
  end

  def purchased?
    update(status: 'purchased')
  end
end
