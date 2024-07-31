class CreateVendors < ActiveRecord::Migration[7.1]
  def change
    create_table :vendors do |t|
      t.string :name
      t.boolean :is_active
      t.string :email
      t.string :phone
      t.text :address
      t.string :country
      t.string :gstn
      t.string :state
      t.string :city
      t.integer :created_by

      t.timestamps
    end
  end
end
