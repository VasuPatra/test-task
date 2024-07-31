class Item < ApplicationRecord
  belongs_to :category
  has_many :item_vendors
  has_many :vendors, through: :item_vendors
  has_many :purchase_order_items
  has_many :purchase_orders, through: :purchase_order_items
end
