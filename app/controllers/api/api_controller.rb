module Api
	class ApiController < ApplicationController
		include MorselsHelper
		protect_from_forgery with: :null_session

		def morsel
			morsel_list = %w(
				soup
				word
				reddit
				weather
				restaurant
				beer
				event
				video
				musicvideo
				recipe
				news
				trivia
				deal
				photo
				view
				charity
			)
			
			localized_morsel_list = %w(				
				weather
				restaurant				
				event
			)

			morsel_type = params[:morsel_type]

			if morsel_list.include?(morsel_type)
				zip_code = localized_morsel_list.include?(morsel_type) ? get_zip() : ""
				morsel = MorselsHelper.get_morsel(morsel_type, zip_code)
				render json: morsel.data
			else
				render json: {error: "#{morsel_type} is not a valid endpoint"}
			end
		end

	private

		# Try to detect the correct zip code from either the user profile 
		# or geocoder (IP address detection).
		def get_zip()
			# Option 1: use zip code supplied in the request params
			if params[:zip_code]
				return params[:zip_code]
			end

			# Option 2: use zip code in the logged-in user's settings
			if logged_in? && current_user.zip_code.length > 0
				return current_user.zip_code
			end

			# Option 3: use zip code that was previously detected and stored in session storage
			if session[:detected_zip_code]
				return session[:detected_zip_code]
			end

			# Option 4: detect zip code using Geocoder gem's IP lookup service
			# But this only works in production because it needs the request to come from a real IP address.
			if Rails.env.production?
				puts "Detecting zip code."
				# The location method can sometimes fail because of timeout so put it in this
				begin
					# request.location is a method that Geocoder added
					zip = request.location.postal_code
					puts "Detected Zip: #{zip}"

					# This isn't guaranteed to return a valid zip so we must check it
					if zip != nil && zip.length > 0
						# Store detected zip code in session storage so it doesn't
						# have to be detected for each morsel API call.
						session[:detected_zip_code] = zip
						return zip
					end
				rescue
					puts "Zip code could not be detected."
				end
			end

			# Option 5: if zip could not be detected then the last resort is to use 90210 as default.
			return "90210"
		end
	end
end