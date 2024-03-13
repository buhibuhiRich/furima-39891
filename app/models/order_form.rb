class OrderForm
  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_from_region_id, :city, :street_address, :building_name, :phone_number, :token, :user_id, :item_id
 
  validates :postal_code, presence: true, format: { with: /\A\d{3}[-]\d{4}\z/ }
  validates :shipping_from_region_id, presence: true
  validates :city, presence: true
  validates :street_address, presence: true
  validates :building_name, presence: true
  validates :phone_number, presence: true, format: { with: /\A\d{10,11}\z/ }
  validates :user_id, presence: true
  validates :item_id, presence: true
  validates :token, presence: true


  def save
    ActiveRecord::Base.transaction do
      order = Order.create!(user_id: user_id, item_id: item_id)
      ShippingAddress.create!(
        order_id: order.id,
        postal_code: postal_code,
        shipping_from_region_id: shipping_from_region_id,
        city: city,
        street_address: street_address,
        building_name: building_name,
        phone_number: phone_number,
      )
    end
  end
end
