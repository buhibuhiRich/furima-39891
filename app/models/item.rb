class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
 
  belongs_to :user
  has_one_attached :image
  belongs_to :condition
  belongs_to :shipping_cost_responsibility
  belongs_to :shipping_from_region
  belongs_to :days_until_shipment

  validates :image, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, only_integer: true }
  validates :condition_id, presence: true
  validates :shipping_cost_responsibility_id, presence: true
  validates :shipping_from_region_id, presence: true
  validates :days_until_shipment_id, presence: true
  validates :id, exclusion: { in: [1], message: "ID 1は選択できません" }
end
