class SessionsController < ApplicationController
	before_action :unauthorize, only: [:new, :create]
	before_action :authorize, only: [:destroy]
	
	def new
		@user = User.new
	end

	def create
		user_params = params.require(:user).permit(:email, :password)
		user = User.find_by(email: user_params[:email])

		if user && user.authenticate(user_params[:password])
			log_in user
			redirect_to root_path and return
	    else
	    	@user = User.new(user_params)
			
	    	# use render instead of redirect so user input can persist in the form
			flash.now[:alert] = "Incorrect username or password"
			render 'sessions/new' and return
	    end
	end

	def destroy
		log_out if logged_in?
	end
end
