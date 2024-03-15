class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :shipping_address


  def purchased?
    orders = Order.where(item_id: item_id)
    orders.exists?
  end
end

