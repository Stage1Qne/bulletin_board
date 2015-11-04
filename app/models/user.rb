class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader

  # validations
  validates :first_name, :last_name, :birthday, :address,
            :city, :state, :country, :zip, presence: true

  # associations
  has_many :ads, dependent: :destroy

  # enums
  enum role: [:user, :moderator, :admin]

  # methods
  def full_name
    [first_name, last_name].map(&:capitalize).join(' ')
  end
end
