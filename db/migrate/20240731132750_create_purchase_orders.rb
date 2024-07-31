class CreatePurchaseOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :purchase_orders do |t|
      t.string :order_number
      t.integer :vendor_id
      t.integer :status
      t.integer :user_id
      t.text :remarks

      t.timestamps
    end
  end
end
