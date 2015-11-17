module AdminPanel
  class BaseController < ActionController::Base
    layout 'admin_panel'
    load_and_authorize_resource

    protect_from_forgery with: :exception

    rescue_from CanCan::AccessDenied do |exception|
      redirect_to root_url, alert: exception.message
    end
  end
end
