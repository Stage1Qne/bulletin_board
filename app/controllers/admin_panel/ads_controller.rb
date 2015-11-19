module AdminPanel
  class AdsController < BaseController
    load_and_authorize_resource
    respond_to :html, except: [:update]
    respond_to :json, only:   [:destroy, :update, :create]

    before_action :set_ad, only: [:edit, :update, :destroy]

    def index
      @ads = Ad.includes(:user).page(params[:page])
    end

    def show; end

    def edit; end

    def update
      respond_to do |format|
        if @ad.update_attributes(ad_params)
          format.json { render json: { redirect: false, dimmer_message: ad_notice_message('successfully updated') }, status: :accepted }
        else
          format.json { render json: @ad.errors, status: :not_acceptable }
        end
      end
    end

    def destroy
      @ad.destroy
      flash[:notice] = ad_notice_message('successfully deleted') if @ad.destroy
      respond_with(:admin_panel, @ad)
    end

    private

    def ad_notice_message(msg)
      "Ad ##{@ad.id} #{msg}"
    end

    def ad_params
      params.require(:ad).permit!
    end

    def set_ad
      @ad = Ad.find(params[:id])
    end
  end
end
