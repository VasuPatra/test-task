class PurchaseOrder < ApplicationRecord
  belongs_to :vendor
  belongs_to :user
  has_many :purchase_order_items
  has_many :items, through: :purchase_order_items

  scope :by_start_date, -> (start_date) { where('created_at >= ?', start_date) if start_date.present? }
  scope :by_end_date, -> (end_date) { where('created_at <= ?', end_date) if end_date.present? }
  scope :by_user, -> (user_id) { where(user_id: user_id) if user_id.present? }
  scope :by_category, -> (category_id) { joins(:items).where(items: { category_id: category_id }).distinct if category_id.present? }
  scope :by_vendor, -> (vendor_id) { where(vendor_id: vendor_id) if vendor_id.present? }
  scope :by_status, -> (status) { where(status: status) if status.present? }
end
