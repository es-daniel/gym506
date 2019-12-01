class CreatePreferredSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :preferred_schedules do |t|
      t.string :schedule
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
