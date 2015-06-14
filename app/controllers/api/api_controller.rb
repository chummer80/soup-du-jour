module Api
	class ApiController < ApplicationController
		protect_from_forgery with: :null_session

		def soup
			render json: Soup.order("RANDOM()").first, except: [:created_at, :updated_at]
		end
	end
end