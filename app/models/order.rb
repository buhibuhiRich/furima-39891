class Order < ApplicationRecord

  belongs_to :user
  belongs_to :item
  has_one :shipping_address

  validates :user, presence: true
  validates :item, presence: true
  
  
  def create_shipping_address(address_params)
    shipping_address = ShippingAddress.create(
      order: self,  
      postal_code: address_params[:postal_code],
      shipping_from_region_id: address_params[:shipping_from_region_id],
      city: address_params[:city],
      street_address: address_params[:street_address],
      building_name: address_params[:building_name],
      phone_number: address_params[:phone_number]
    )
    shipping_address.save
    shipping_address
  end

  def purchased?
    update(status: 'purchased')
  end

end  