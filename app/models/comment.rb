class Comment < ActiveRecord::Base
  # associations
  with_options required: true do |c|
    c.belongs_to :user
    c.belongs_to :ad
  end

  # validations
  validates :content, presence: true
end
