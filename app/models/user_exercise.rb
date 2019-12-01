class UserExercise < ApplicationRecord
  belongs_to :preferred_day
  belongs_to :user

  validates :name, presence: true
  validates :series, presence: true
  validates :repetitions, presence: true
  validates :user_rest, presence: true
end
