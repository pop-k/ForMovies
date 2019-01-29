class PaymentsController < ApplicationController

	def create
  		@payment = Payment.new(payment_params)
  		@payment.user_id = current_user.id
  		@payment.save
  		redirect_to user_path(current_user)
  	end

  	def balance_save
  		@payment = Payment.find(params[:payment_id])
  		@user = User.find(params[:user_id])
      @user.update(balance: @user.balance += @payment.payment)
      @payment.save(payment: @payment.approval = 1)
      redirect_to payments_path
  	end

  	def nagesen
  		@content = Content.find(params[:content_id])
  		@user = User.find(params[:user_id])
  		@user.update(balance: @user.balance += 10)
  		current_user.update(balance: current_user.balance -= 10)
  		redirect_to content_path(@content)
  	end

  	def destroy
    	@payment = Payment.find(params[:id])
    	@payment.destroy
    	redirect_to payments_path
    end

  	private

	def payment_params
    	params.require(:payment).permit(:payment, :user_id)
 	end
end
