class ApplicationController < ActionController::Base
	include SessionsHelper
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception

	def index
		if logged_in?
			@morsel_list = current_user.morsels
		else
			@morsel_list = ["soup", "restaurant", "weather", "word"]
		end
	end
end
