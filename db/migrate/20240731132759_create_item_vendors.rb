class CreateItemVendors < ActiveRecord::Migration[7.1]
  def change
    create_table :item_vendors do |t|
      t.belongs_to :vendor
      t.belongs_to :item

      t.timestamps
    end
  end
end
