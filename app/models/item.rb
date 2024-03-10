class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :shipping_charge
  belongs_to :shipment_region
  belongs_to :days_to_ship

  belongs_to :user
  has_one_attached :image

  validates :image,                       presence: true
  validates :item_name,                   presence: true, length: { maximum: 40 }
  validates :item_description,            presence: true, length: { maximum: 1000 }
  validates :category_id,                 numericality: { other_than: 1, message: "can't be blank" }
  validates :state_id,                    numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_charge_id,          numericality: { other_than: 1, message: "can't be blank" }
  validates :shipment_region_id,          numericality: { other_than: 1, message: "can't be blank" }
  validates :days_to_ship_id,             numericality: { other_than: 1, message: "can't be blank" }
  validates :price,                       presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end