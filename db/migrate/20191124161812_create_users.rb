class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :last_name
      t.integer :identification
      t.datetime :birthday
      t.string :email
      t.integer :phone_number
      t.string :address
      t.float :weight
      t.float :height
      t.integer :gender
      t.float :imc
      t.string :objectives
      t.string :position
      t.integer :role, default: 2
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
