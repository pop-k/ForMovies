class AdminsController < ApplicationController

before_action :authenticate_admin!

	def show
	end

	def payments
		@payments = Payment.all
	end

	def index
		@users = User.all
	end


end

private
	def payment_params
    	   params.require(:payment).permit(:payment)
 	end
