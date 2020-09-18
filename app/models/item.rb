class Item < ApplicationRecord
has_one_attached :image
belongs_to :user

with_options presence: true do
  validates :name
  validates :category_id
  validates :condition_id
  validates :shipping_charges_id
  validates :shipping_area_id
  validates :days_to_ship_id
  validates :description
  validates :price
end
end
