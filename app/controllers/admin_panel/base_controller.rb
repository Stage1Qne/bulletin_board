module AdminPanel
  class BaseController < ActionController::Base
    layout 'admin_panel'
    protect_from_forgery with: :exception

    before_action :authenticate_user!
    before_action :verify_access

    def render_403
      render file: "#{Rails.root}/public/403.html", status: 403, layout: false
    end

    # cancan ability rescue
    rescue_from CanCan::AccessDenied do
      render_403
    end

    def current_ability
      @current_ability ||= AdminPanel::Ability.new(current_user)
    end

    private

    def verify_access
      render_403 if current_user.default_user?
    end
  end
end
