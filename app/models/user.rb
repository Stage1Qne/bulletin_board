class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # validations
  validates :first_name, :last_name, :birthday, :address,
            :city, :state, :country, :zip, presence: true

  # enums
  enum role: [:user, :moderator, :admin]
end
