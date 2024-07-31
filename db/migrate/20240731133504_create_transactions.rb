class CreateTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :transactions do |t|
      t.integer :transaction_type
      t.integer :perform_by
      t.integer :vendor_id
      t.integer :item_id
      t.integer :qty
      t.integer :user_id
      t.integer :purchase_order_id
      t.float :amount

      t.timestamps
    end
  end
end
