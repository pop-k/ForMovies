class AdminsController < ApplicationController

before_action :authenticate_admin!

	def show
		@users = User.all
	end

	def payments
		@payments = Payment.all
	end

end

private
	def payment_params
    	   params.require(:payment).permit(:payment)
 	end
