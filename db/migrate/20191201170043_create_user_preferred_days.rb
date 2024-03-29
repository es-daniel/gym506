class CreateUserPreferredDays < ActiveRecord::Migration[6.0]
  def change
    create_table :user_preferred_days do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :preferred_day, null: false, foreign_key: true

      t.timestamps
    end
  end
end
