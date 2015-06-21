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
			# If zip code was supplied as a query parameter, then use it.
			zip = params[:zip_code] || get_zip(request)
			render json: MorselsHelper.get_morsel("weather", zip).data
		end

		def restaurant
			zip = params[:zip_code] || get_zip(request)
			render json: MorselsHelper.get_morsel("restaurant", zip).data
		end

		def beer
			render json: MorselsHelper.get_morsel("beer").data
		end


		# Try to detect the correct zip code from either the user profile 
		# or geocoder (IP address detection).
		def get_zip(request)
			zip = nil

			# Try to get zip code from logged-in user's profile
			if logged_in?
				zip = current_user.zip_code
			end

			# If we still don't have the zip code then get it using the geocoder gem.
			# But this only works in production because it needs the user to be at a real IP address.
			puts "BEFORE IF: zip is #{zip.to_s}"
			puts "Rails.env.production? is #{Rails.env.production?.to_s}"
			if (zip.nil? || zip == "") && Rails.env.production?
				puts "IF STATEMENT was entered"
				zip = request.location.postal_code
			end
			puts "AFTER IF: zip is #{zip.to_s}"

			# If we still don't have the zip code then use a default (Beverly Hills)
			if zip.nil? || zip == ""
				zip = "90210"
			end	

			zip
		end
	end
end