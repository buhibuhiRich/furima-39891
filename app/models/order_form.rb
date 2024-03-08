class OrderForm
  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_from_region_id, :city, :street_address, :building_name, :phone_number, :user_id, :token, :item_id
 
  validates :postal_code, presence: true, format: { with: /\A\d{3}[-]\d{4}\z/ }
  validates :shipping_from_region_id, presence: true
  validates :city, presence: true
  validates :street_address, presence: true
  validates :building_name, presence: true
  validates :phone_number, presence: true, format: { with: /\A\d{10,11}\z/ }
  validates :token, presence: true
  validates :user_id, presence: true
  validates :item_id, presence: true
  
  def order_form_params
    {
      postal_code: postal_code,
      shipping_from_region_id: shipping_from_region_id,
      city: city,
      street_address: street_address,
      building_name: building_name,
      phone_number: phone_number,
      item_id: item_id,
      user_id: user_id,
      token: token
    }
  end
  
  def save
    order = Order.new(
      user_id: user_id,
      item_id: item_id
    )

    if order.valid?
      ShippingAddress.create(
        order: order,
        postal_code: postal_code,
        shipping_from_region_id: shipping_from_region_id,
        city: city,
        street_address: street_address,
        building_name: building_name,
        phone_number: phone_number
      )
    end
  end
end

