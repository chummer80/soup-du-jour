class UsersController < ApplicationController
	before_action :unauthorize, only: [:new, :create]
	before_action :authorize, only: [:edit_settings, :update_settings]
	def new
		@user = User.new
	end

	def create
		user_params = params.require(:user).permit(:email, :password, :password_confirmation)
		
		error_msg = ""

		if User.find_by(email: user_params[:email])
			error_msg = "That email is taken!"
		elsif user_params[:password] != user_params[:password_confirmation]
			error_msg = "Password and password confirmation didn't match"
		elsif user_params[:password].length < 6
			error_msg = "Password must be at least 6 characters long"
		else
			# set some default values for user stats
			user_params[:zip_code] = ""
			user_params[:interests] = []
			user_params[:morsels] = ["soup"]

			user = User.create(user_params)
			if user.valid?
				log_in(user)
				redirect_to root_path and return
			else
				error_msg = 'Unable to register you as new user'
			end
		end
			
		if error_msg
			# retain form input for user-friendliness
			@user = User.new(user_params)	
			flash.now[:alert] = error_msg
			render 'new'
		end
	end


	def edit_settings
		@user = current_user
	end

	def update_settings
		user = current_user
		user_params = params.require(:user).permit(:zip_code, interests: [])
		
		if user.update_attributes(user_params)
			redirect_to root_path
		else
			@user = User.new(user_params)
			render 'edit_settings'
		end

	end
end
