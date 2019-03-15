class RelationshipsController < ApplicationController

	def create
		@relationship = Relationship.create(create_params)
		redirect_to user_path(@relationship.following_id)
	end

	def destroy
		@relationship = Relationship.find(params[:id])
		@user = User.find(@relationship.following_id)
		@relationship.destroy
		redirect_to user_path(@user)
	end

  private
	def create_params
		params.permit(:following_id).merge(follower_id: current_user.id)
	end

end
