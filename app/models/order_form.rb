class OrderForm 
  attr_accessor :token, :price
  include ActiveModel::Model
  include ActiveModel::Validations
  attr_accessor :postal_code, :shipping_from_region_id, :city, :street_address, :building_name, :phone_number, :user

  validates :postal_code, presence: true, format:{ with: /\A\d{3}[-]\d{4}\z/ }
  validates :shipping_from_region_id, presence: true
  validates :city, presence: true
  validates :street_address, presence: true
  validates :building_name, presence: true
  validates :phone_number, presence: true, format: { with: /\A\d{10,11}\z/ }
  validates :token, presence: true

  def save
    return false unless valid?

    order = Order.create!(
      postal_code: postal_code,
      shipping_from_region_id: shipping_from_region_id,
      city: city,
      street_address: street_address,
      building_name: building_name,
      phone_number: phone_number,
      user: user,
    )
  

    true 
  end
end
