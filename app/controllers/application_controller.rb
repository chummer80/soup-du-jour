class ApplicationController < ActionController::Base
	include SessionsHelper
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception

	def index
		if logged_in?
			@morsel_list = current_user.morsels
		else
			# default list of morsels when no user is logged in is the entire set of morsels.
			@morsel_list = MorselsHelper.get_morsel_list("all")
		end
	end
end
