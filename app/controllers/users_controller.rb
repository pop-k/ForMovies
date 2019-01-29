class UsersController < ApplicationController

  def index
		  @users = User.all
	end

	def show
		  @user = User.find(params[:id])
		  @contents = Content.where(user_id: @user.id)
	end

	def following
      @user  = User.find(params[:id])
      @users = @user.following
      redirect_to show_follow_path
  end

  def followers
   	  @user  = User.find(params[:id])
   	 	@users = @user.followers
   	  redirect_to show_follow_path
  end

  def favorite_contents
      @user = current_user
      @favorite_contents = FavoriteContent.where(user_id: @user.id).page(params[:page]).per(10).order(id: "DESC")
      #@search = Product.ransack(params[:q])
  end

  def payment_request
  		@user = User.find(current_user[:id])
  	  @payment = Payment.new
      @payments = Payment.where(user_id: @user.id).page(params[:page]).per(20).order(id: "DESC")
  end

  # def formove_index
  #     @nagesens = Nagesen.where(user_id: current_user.id)
  # end

	def edit
		  @user = User.find(params[:id])
      if current_user.id != @user.id
         redirect_to user_path(current_user)
      end
	end

	def update
		  @user = User.find(params[:id])
		  @user.update(user_params)
		  redirect_to user_path(@user.id)
	end

private

	def user_params
    	params.require(:user).permit(:name, :image, :introduction)
 	end

  def balance_params
      params.require(:user).permit(:balance)
  end

 	def payment_params
      params.require(:payment).permit(:payment)
 	end
end
