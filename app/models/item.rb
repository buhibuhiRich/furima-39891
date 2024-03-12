class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
 
  belongs_to :user
  has_one_attached :image
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_cost_responsibility
  belongs_to :shipping_from_region
  belongs_to :days_until_shipment
  has_one :order
 
  validates :image, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, only_integer: true }
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_cost_responsibility_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_from_region_id, numericality:{ other_than: 1 , message: "can't be blank"}
  validates :days_until_shipment_id, numericality: { other_than: 1 , message: "can't be blank"}
  

  def sold_out?
    
  end



end



  
