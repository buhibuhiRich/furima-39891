class OrderForm
  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_from_region_id, :city, :street_address, :building_name, :phone_number

  validates :postal_code, presence: true
  validates :shipping_from_region_id, presence: true
  validates :city, presence: true
  validates :street_address, presence: true
  validates :building_name, presence: true
  validates :phone_number, presence: true



  def save
    return false unless valid?
  end












end
