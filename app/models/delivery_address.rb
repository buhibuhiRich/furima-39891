class DeliveryAddress < ApplicationRecord
  belongs_to :order
  belongs_to :shipping_from_region
end
