class User < ActiveRecord::Base
  # devise
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # uploaders
  mount_uploader :avatar, AvatarUploader

  # validations
  validates :first_name, :last_name, :birthday, :address,
            :city, :state, :country, :zip, presence: true

  # associations
  with_options dependent: :destroy do |user|
    user.has_many :ads
    user.has_many :comments
  end

  # enums
  enum role: [:default_user, :moderator, :admin]

  # methods
  def full_name
    [first_name, last_name].map(&:capitalize).join(' ')
  end
end
