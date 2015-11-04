require 'rails_helper'

describe User do
  subject(:user) { build(:user) }

  it 'has a valid factory' do
    expect(user).to be_valid
  end

  describe 'validations' do
    it 'require a first name' do
      expect(build(:user, first_name: '')).to_not be_valid
    end

    it 'require a last name' do
      expect(build(:user, last_name: '')).to_not be_valid
    end

    it 'require a birthday' do
      expect(build(:user, birthday: '')).to_not be_valid
    end

    it 'require a address' do
      expect(build(:user, address: '')).to_not be_valid
    end

    it 'require a city' do
      expect(build(:user, city: '')).to_not be_valid
    end

    it 'require a state' do
      expect(build(:user, state: '')).to_not be_valid
    end

    it 'require a country' do
      expect(build(:user, country: '')).to_not be_valid
    end

    it 'require a zip' do
      expect(build(:user, zip: '')).to_not be_valid
    end
  end

  it '#user?' do
    user.role = 0
    expect(user.user?).to be true
  end

  it '#moderator?' do
    user.role = 1
    expect(user.moderator?).to be true
  end

  it '#admin?' do
    user.role = 2
    expect(user.admin?).to be true
  end

  it '#full_name' do
    user.first_name = 'alex'
    user.last_name = 'DEME'
    expect(user.full_name).to eq('Alex Deme')
  end
end
