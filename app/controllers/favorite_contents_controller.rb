class FavoriteContentsController < ApplicationController

  def create
      @user_id = current_user.id
      @content_id = Content.find(params[:id]).id
      @favorite_content = FavoriteContent.new(content_id: @content_id, user_id: @user_id)
     if @favorite_content.save
        redirect_to favorite_contents_path
     end
  end


  def destroy
  	@favorite_content = FavoriteContent.find(params[:id])
    if @favorite_content.destroy
       redirect_to favorite_contents_path
    end
  end

private
      def content_params
        params.require(:content).permit(:id, :content_id, :user_id)
      end
end
