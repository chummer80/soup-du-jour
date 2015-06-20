module Api
	class ApiController < ApplicationController
		include MorselsHelper
		protect_from_forgery with: :null_session

		def soup
			render json: MorselsHelper.get_morsel("soup").data
		end

		def word
			render json: MorselsHelper.get_morsel("word").data
		end

		def reddit
			render json: MorselsHelper.get_morsel("reddit").data
		end

		def weather
			render json: MorselsHelper.get_morsel("weather", "90210").data
		end

		def restaurant
			render json: MorselsHelper.get_morsel("restaurant", "90210").data
		end

		def beer
			render json: MorselsHelper.get_morsel("beer").data
		end
	end
end