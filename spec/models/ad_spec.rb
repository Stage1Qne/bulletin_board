require 'rails_helper'

RSpec.describe Ad, type: :model do
  subject(:ad) { build(:ad) }

  it 'has a valid factory' do
    expect(ad).to be_valid
  end

  it 'require belongs to user' do
    expect(Ad.reflect_on_association(:user).macro).to eq(:belongs_to)
  end

  it 'require have many comments' do
    expect(Ad.reflect_on_association(:comments).macro).to eq(:has_many)
  end

  describe 'validations' do
    it 'require a content' do
      expect(build(:ad, content: '')).to_not be_valid
    end

    it 'require a user' do
      expect(build(:ad, user: nil)).to_not be_valid
    end
  end

  it '#truncated_content' do
    ad.content = 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec qu' # 200
    expect(ad.truncated_content).to eq('Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis...')
  end
end
