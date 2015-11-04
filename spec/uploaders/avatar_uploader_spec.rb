# require 'rails_helper'
require 'carrierwave/test/matchers'

describe AvatarUploader do
  include CarrierWave::Test::Matchers

  before do
    @user = build(:user)
    AvatarUploader.enable_processing = true
    @uploader = AvatarUploader.new(@user, :avatar)

    File.open(Rails.root.join('app/assets/images/fallback/default_user.png')) do |f|
      @uploader.store!(f)
    end
  end

  after do
    AvatarUploader.enable_processing = false
    @uploader.remove!
  end

  # rspec 3 warnings for 0.10 version cw gem

  # context 'the thumb version' do
  #   it 'should scale down a landscape image to be exactly 50 by 50 pixels' do
  #     @uploader.thumb.should have_dimensions(50, 50)
  #   end
  # end

  # it 'should make the image readable only to the owner and not executable' do
  #   @uploader.should have_permissions(0600)
  # end
end
