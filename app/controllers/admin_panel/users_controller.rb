module AdminPanel
  class UsersController < BaseController
    respond_to :html, except: [:update]
    respond_to :json, only:   [:destroy, :update, :create]

    before_action :set_user, only: [:edit, :update, :destroy]
    before_action :check_password_params, only: [:update]

    def index
      @users = User.page(params[:page])
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)
      respond_to do |format|
        if @user.save
          flash[:notice] = user_notice_message('successfully added')
          format.json { render json: { redirect: true, redirect_path: edit_admin_panel_user_path(@user), dimmer_message: user_notice_message('successfully created') }, status: :created }
        else
          format.json { render json: @user.errors, status: :not_acceptable }
        end
      end
    end

    def show; end

    def edit; end

    def update
      respond_to do |format|
        if @user.update_attributes(user_params)
          format.json { render json: { redirect: false, dimmer_message: user_notice_message('successfully updated') }, status: :accepted }
        else
          format.json { render json: @user.errors, status: :not_acceptable }
        end
      end
    end

    def destroy
      @user.destroy
      flash[:notice] = user_notice_message('successfully deleted') if @user.destroy
      respond_with(:admin_panel, @user)
    end

    private

    def user_notice_message(msg)
      "User ##{@user.id} #{@user.full_name} #{msg}"
    end

    def user_params
      params.require(:user).permit(:role, :first_name, :last_name, :birthday,
                                   :address, :city, :state, :country, :zip,
                                   :email, :password, :password_confirmation,
                                   :avatar)
    end

    def set_user
      @user = User.find(params[:id])
    end

    def check_password_params
      return if params[:user].present? && params[:user][:password].present?
      params[:user].except!(:password, :password_confirmation)
    end
  end
end
