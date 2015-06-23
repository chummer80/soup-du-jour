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

		def event
			zip = params[:zip_code] || get_zip(request)
			render json: MorselsHelper.get_morsel("event", zip).data
		end
		
		def video
			render json: MorselsHelper.get_morsel("video").data
		end

		def recipe
			render json: MorselsHelper.get_morsel("recipe").data
		end

		def news
			render json: MorselsHelper.get_morsel("news").data
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
			# But this only works in production because it needs the request to come from a real IP address.
			if (zip.nil? || zip == "") && Rails.env.production?
				puts "Detecting zip code."
				# The location method can sometimes fail because of timeout so put it in this
				begin
					zip = request.location.postal_code
					puts "Detected Zip: #{zip}"
				rescue
					puts "Zip code could not be detected."
				end
			end

			# If we still don't have the zip code then use a default (Beverly Hills)
			if zip.nil? || zip == ""
				zip = "90210"
			end	

			zip
		end
	end
end