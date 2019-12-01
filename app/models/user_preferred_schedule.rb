class UserPreferredSchedule < ApplicationRecord
  belongs_to :user
  belongs_to :preferred_schedule
end
