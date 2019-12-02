class GymService < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :photo, presence: true, on: :create
  has_one_attached :photo, dependent: :purge_now
end
