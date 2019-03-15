class CommentsController < ApplicationController

	def create
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
