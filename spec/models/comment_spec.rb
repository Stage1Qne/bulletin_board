require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject(:comment) { build(:comment) }

  it 'has a valid factory' do
    expect(comment).to be_valid
  end

  it 'require belongs to user' do
    expect(Comment.reflect_on_association(:user).macro).to eq(:belongs_to)
  end

  it 'require belongs to ad' do
    expect(Comment.reflect_on_association(:ad).macro).to eq(:belongs_to)
  end

  describe 'validations' do
    it 'require a content' do
      expect(build(:comment, content: '')).to_not be_valid
    end

    it 'require a user' do
      expect(build(:comment, user: nil)).to_not be_valid
    end

    it 'require a ad' do
      expect(build(:comment, user: nil)).to_not be_valid
    end
  end
end
