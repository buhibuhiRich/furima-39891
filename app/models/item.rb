class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # devise :recoverable, :rememberable, :validatable
  belongs_to :user
  has_one_attached :image
  validates :image, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :shipping_cost_responsibility_id, presence: true
  validates :shipping_from_region_id, presence: true
  validates :days_until_shipment_id, presence: true
end
