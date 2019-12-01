class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities do |t|
      t.string :name
      t.datetime :start_date
      t.integer :maximum_capacity
      t.integer :enrolled
      t.datetime :deleted_at
      t.belongs_to :user

      t.timestamps
    end
  end
end
