class CreatePurchaseOrderItems < ActiveRecord::Migration[7.1]
  def change
    create_table :purchase_order_items do |t|
      t.integer :item_id
      t.integer :qty
      t.float :amount
      t.belongs_to :purchase_order
      
      t.timestamps
    end
  end
end
