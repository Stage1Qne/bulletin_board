module AdminPanel
  class UsersController < BaseController
    respond_to :html, :js

    before_action :set_user, only: [:edit, :update, :destroy]

    def index
      @users = User.order(id: :desc)
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)
      flash[:notice] = user_notice_message('successfully added') if @user.save
      respond_with(:admin_panel, @user)
    end

    def show; end

    def edit; end

    def update
      @user.update_attributes(user_params)
      flash[:notice] = user_notice_message('successfully updated') if @user.save
      respond_with(:admin_panel, @user)
    end

    def destroy
      @user.destroy
      flash[:notice] = user_notice_message('successfully deleted') if @user.destroy
      respond_with(:admin, @user)
    end

    private

    def user_notice_message(msg)
      "User ##{@user.id} #{@user.full_name} #{msg}"
    end

    def user_params
      params.require(:user).permit(:role, :first_name, :last_name, :birthday,
                                   :address, :city, :state, :country, :zip,
                                   :email, :password, :password_confirmation)
    end

    def set_user
      @user = User.find(params[:id])
    end
  end
end
