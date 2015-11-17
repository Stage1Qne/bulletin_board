class User < ActiveRecord::Base
  # constants
  ADMIN_PANEL_ROLES = %w(admin moderator)

  # devise
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # uploaders
  mount_uploader :avatar, AvatarUploader

  # validations
  validates :first_name, :last_name, :birthday, :address,
            :city, :state, :country, :zip, presence: true

  # associations
  with_options dependent: :destroy do |u|
    u.has_many :ads
    u.has_many :comments
  end

  # enums
  enum role: [:default_user, :moderator, :admin]

  # methods
  def full_name
    [first_name, last_name].map(&:capitalize).join(' ')
  end
end
