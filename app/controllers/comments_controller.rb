class CommentsController < ApplicationController

  def create
  	  # @content = Content.find(params[:content_id])
  	  # (content_id: params[:content_id], user_id: current_user.id)
      @comment = Comment.new(comment_params)
      @comment.user_id = current_user.id
      @content_path = @comment.content
      @comment.save
      redirect_to content_path(@content_path)
  end

  def destroy
      @content = Content.find(params[:id])
      @comment.destroy
      redirect_to content_path(@content)
  end
private
	def comment_params
    	params.require(:comment).permit(:content_id, :user_id, :body)
 	end

end
