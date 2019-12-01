class UserPreferredDay < ApplicationRecord
  belongs_to :user
  belongs_to :preferred_day
end
