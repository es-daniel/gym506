class CreateUserExercises < ActiveRecord::Migration[6.0]
  def change
    create_table :user_exercises do |t|
      t.belongs_to :preferred_day, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true
      t.string :name
      t.string :repetitions
      t.integer :series
      t.string :user_rest
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
