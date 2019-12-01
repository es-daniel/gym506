class Activity < ApplicationRecord
  belongs_to :instructor, class_name: 'User', foreign_key: :user_id
end
