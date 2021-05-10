class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping
  belongs_to :shipping_area
  belongs_to :days_to_ship

  VALID_PRICEL_HALF =                 /\A[0-9]+\z/
  validates :title, :text, :price, :image, presence: true
  validates :category_id, :shipping_id, :status_id, :days_to_ship_id, numericality: { other_than: 1 } 
  validates :shipping_area_id, numericality: { other_than: 0 }
  validates :price, presence: true, format: {with: VALID_PRICEL_HALF}, numericality:{ only_integer: true,
    greater_than: 300, less_than: 10000000
    }
   
  
  has_one_attached :image

  belongs_to :user
end
