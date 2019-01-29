class ContentsController < ApplicationController
# before_action :set_content, only: [:show, :edit, :update, :destroy]

	def index
      @keyword = Content.ransack(params[:q])
      @contents = Content.all.page(params[:page]).per(36).order(id: "DESC")
	end

  def search_result
      @keyword = Content.ransack(params[:q])
      @contents = @keyword.result
  end

	def show
      @content = Content.find(params[:id])
      @user = @content.user
      @comment = Comment.new
      @comments = Comment.where(content_id: @content.id).per(40).order(id: "DESC")
      @keyword = Content.ransack(params[:q])
  end

  def time_line
      @contents = Content.where(user_id: current_user.following_ids)
      @keyword = Content.ransack(params[:q])
  end

	def new
		  @content = Content.new
	end

	def create
      @content = Content.new(content_params)
      @content.user_id = current_user.id
   if @content.save
      redirect_to @content, notice: 'Content was successfully created.'
   else
      render :new
   end
  end

	def update
      respond_to do |format|
   if @content.update(content_params) && @content.video.recreate_versions!
      format.html { redirect_to @content, notice: 'Content was successfully updated.' }
      format.json { head :no_content }
   else
      format.html { render action: 'edit' }
      format.json { render json: @content.errors, status: :unprocessable_entity }
      end
   end
  end

	def destroy
      @content.destroy
      respond_to do |format|
      format.html { redirect_to contents_url, notice: 'Content was successfully destroyed.' }
      format.json { head :no_content }
      end
  end

	private
    def content_params
        params.require(:content).permit(:title, :video, :description, :user_id)
    end

end