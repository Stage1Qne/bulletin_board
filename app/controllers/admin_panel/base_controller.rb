module AdminPanel
  class BaseController < ActionController::Base
    layout 'admin_panel'

    protect_from_forgery with: :exception
  end
end
