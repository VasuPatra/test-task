class Transaction < ApplicationRecord
  belongs_to :vendor
  belongs_to :item
  belongs_to :user
  belongs_to :purchase_order
end
