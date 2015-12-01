require 'rails_helper'
require 'shared_contexts'

describe 'Admin panel', type: :request do
  include_context 'user sign in\out methods'
  include_context 'Warden before and after hooks'

  let!(:user) { build(:user) }
  let!(:admin) { build(:admin) }

  context 'when guest users' do
    it 'does redirect to sign in' do
      get '/admin_panel'
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  context 'when default users' do
    it 'render 403 forbidden' do
      sign_in(user)
      get '/admin_panel'
      expect(response).to have_http_status(:forbidden)
    end
  end

  context 'when admin' do
    it 'does allowed access' do
      sign_in(admin)
      get '/admin_panel'
      expect(response).to have_http_status(:ok)
    end
  end
end
