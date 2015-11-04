class Ad < ActiveRecord::Base
  # associations
  belongs_to :user, required: true

  # validations
  validates :content, presence: true

  # methods
  def truncated_content
    content.truncate(160, separator: /\s/)
  end
end
