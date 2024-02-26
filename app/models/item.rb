class Item < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :shipping_cost_responsibility_id, presence: true
  validates :shipping_from_region_id, presence: true
  validates :days_until_shipment_id, presence: true
  validates :genre_id, presence: { message: "を選択してください" }, numericality: { other_than: 1, message: "を選択してください" }
end
