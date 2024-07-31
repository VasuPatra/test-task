class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.text :name
      t.integer :qty
      t.boolean :is_active
      t.text :additional_remark
      t.text :description
      t.string :item_code
      t.belongs_to :category

      t.timestamps
    end
  end
end
