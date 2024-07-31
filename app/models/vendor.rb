class Vendor < ApplicationRecord
  has_many :item_vendors
  has_many :items, through: :item_vendors
  has_many :purchase_orders
  has_many :transactions
end
