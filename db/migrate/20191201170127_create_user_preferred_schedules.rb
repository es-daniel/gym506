class CreateUserPreferredSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :user_preferred_schedules do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :preferred_schedule, null: false, foreign_key: true

      t.timestamps
    end
  end
end
