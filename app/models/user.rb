class User < ApplicationRecord
  has_many :purchase_orders
  has_many :transactions
end
