json.extract! transaction, :id, :transaction_type, :perform_by, :vendor_id, :item_id, :qty, :user_id, :purchase_order_id, :amount, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
