class UsersController < ApplicationController
	before_action :unauthorize, only: [:new, :create]
	before_action :authorize, only: [:edit_settings, :update_settings, :edit_morsels, :update_morsels]
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
			user_params[:morsels] = MorselsHelper.get_morsel_list("all")

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
		if params[:cancel]
			redirect_to root_path
		else
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

	def edit_morsels
		@user = current_user

		# Create an array of morsels that are not currently in 
		# the user's morsel preferences. This list will be on the right
		all_morsels = MorselsHelper.get_morsel_list("all")
		@unselected_morsels = all_morsels - @user.morsels
	end

	def update_morsels
		if params[:cancel]
			redirect_to root_path
		else
			user = current_user
			morsel_params = {morsels: JSON.parse(params[:final_user_morsels])}
			
			if user.update_attributes(morsel_params)
				redirect_to root_path
			else
				@user = User.new(morsel_params)
				render 'edit_morsels'
			end			
		end
	end
end
