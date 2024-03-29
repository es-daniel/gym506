class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_preferred_days
  has_many :preferred_days, through: :user_preferred_days
  has_many :user_preferred_schedules
  has_many :preferred_schedules, through: :user_preferred_schedules

  has_one_attached :photo

  before_validation :create_password, on: :create

  validates :name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :phone_number, presence: true
  validates :address, presence: true
  validates :role, presence: true
  validates :password, presence: true
  validates :position, presence: true, if: -> { admin? || instructor? }
  validates :identification, presence: true, if: -> { partner? }
  validates :birthday, presence: true, if: -> { partner? }
  validates :weight, presence: true, if: -> { partner? }
  validates :height, presence: true, if: -> { partner? }
  validates :gender, presence: true, if: -> { partner? }
  validates :imc, presence: true, if: -> { partner? }

  enum role: %i[admin instructor partner]
  enum gender: %i[male female]
  enum status: %i[defaulter without_defaulter]

  def full_name
    "#{name} #{last_name}"
  end

  private

  def create_password
    self.password = SecureRandom.hex(16)  if password.nil?
  end

end
