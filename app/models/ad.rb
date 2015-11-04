class Ad < ActiveRecord::Base
  mount_uploader :picture, PictureUploader

  # associations
  belongs_to :user, required: true

  # validations
  validates :content, presence: true

  # methods
  def truncated_content
    content.truncate(160, separator: /\s/)
  end
end
