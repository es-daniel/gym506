class User < ApplicationRecord
  validates :name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :phone_number, presence: true
  validates :address, presence: true
  validates :role, presence: true
  validates :position, presence: true, if: -> { admin? }
  validates :identification, presence: true, if: -> { partner? }
  validates :birthday, presence: true, if: -> { partner? }
  validates :weight, presence: true, if: -> { partner? }
  validates :height, presence: true, if: -> { partner? }
  validates :gender, presence: true, if: -> { partner? }
  validates :imc, presence: true, if: -> { partner? }

  enum role: %i[admin instructor partner]
end
