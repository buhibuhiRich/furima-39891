class OrderForm
  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_from_region_id, :city, :street_address, :building_name, :phone_number, :token, :user_id, :item_id
 
  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :user_id, :item_id, :token, :city, :street_address
  end
  
  validates :shipping_from_region_id, numericality: { other_than: 1, message: "can't be blank" }
  
  def save
    ActiveRecord::Base.transaction do
      order = Order.create!(user_id: user_id, item_id: item_id)
      ShippingAddress.create(
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

  def item
    Item.find(item_id)
  end

end
