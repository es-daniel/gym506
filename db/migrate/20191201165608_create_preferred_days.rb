class CreatePreferredDays < ActiveRecord::Migration[6.0]
  def change
    create_table :preferred_days do |t|
      t.string :day
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
