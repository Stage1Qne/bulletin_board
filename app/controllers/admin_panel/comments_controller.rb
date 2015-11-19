module AdminPanel
  class CommentsController < BaseController
    load_and_authorize_resource
    respond_to :html, except: [:update]
    respond_to :json, only:   [:destroy, :update, :create]

    before_action :set_comment, only: [:edit, :update, :destroy]

    def index
      @comments = Comment.includes(:user, :ad).page(params[:page])
    end

    def show; end

    def edit; end

    def update
      respond_to do |format|
        if @comment.update_attributes(comment_params)
          format.json { render json: { redirect: false, dimmer_message: comment_notice_message('successfully updated') }, status: :accepted }
        else
          format.json { render json: @comment.errors, status: :not_acceptable }
        end
      end
    end

    def destroy
      @comment.destroy
      flash[:notice] = comment_notice_message('successfully deleted') if @comment.destroy
      respond_with(:admin_panel, @comment)
    end

    private

    def comment_notice_message(msg)
      "Comment ##{@comment.id} #{msg}"
    end

    def comment_params
      params.require(:comment).permit!
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end
  end
end
