class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :days_to_ship

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

  with_options numericality: { other_than: 1 } do
  validates :category_id
  validates :condition_id
  validates :shipping_charges_id
  validates :shipping_area_id
  validates :days_to_ship_id
  end
end
