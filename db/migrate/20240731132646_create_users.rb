class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :username
      t.string :encrypted_password
      t.bigint :role_id
      t.boolean :is_active
      t.string :full_name

      t.timestamps
    end
  end
end
