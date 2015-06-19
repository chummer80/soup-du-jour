module Api
	class ApiController < ApplicationController
		protect_from_forgery with: :null_session

		def soup
			render json: Soup.order("RANDOM()").first, except: [:created_at, :updated_at]
		end

		def word
			word_key = Figaro.env.word_key
			@wordapi = HTTParty.get"http://api.wordnik.com:80/v4/words.json/wordOfTheDay?api_key=#{word_key}"
			dictionary = {
					'word' => @wordapi['word'].capitalize,
					'definition' => @wordapi["note"]
			}

			render json: dictionary
		end

		def reddit
			@redditapi=HTTParty.get"https://www.reddit.com/top.json"
			top_post = {
					'title' => @redditapi['data']['children'][0]['data']['title'],
					'permalink' => @redditapi['data']['children'][0]['data']['permalink']
			}
			render json:top_post
		end

		def weather
			weather_key = Figaro.env.weather_key
			# zip=params[:search].present? ? params[:search].to_i : 90210
			#can't add link_to or image_tags on json data, will have to add on the call
			@weatherapi = HTTParty.get"http://api.wunderground.com/api/#{weather_key}/conditions/q/90210.json"
			forecast = {
			'location' => @weatherapi["current_observation"]["display_location"]['full'],
			'current_temp' => @weatherapi["current_observation"]["temperature_string"],
			'icon' =>  @weatherapi["current_observation"]["icon_url"]
			}
			render json:forecast
		end

		def yelp
			@yelpapi = Yelp.client.search("90210", {term: 'food', radius_filter: 5, limit: 15})
			food ={
			'first_img' => @yelpapi.raw_data['businesses'][0]['image_url'],
			'bizname' => @yelpapi.raw_data['businesses'][0]['name'],
			'rating' => @yelpapi.raw_data['businesses'][0]['rating_img_url'],
			'comment' => @yelpapi.raw_data['businesses'][0]['snippet_text'],
			'yelp_link' => @yelpapi.raw_data['businesses'][0]['url']
			}
			render json:food
		end

		def beer
			beer_key = Figaro.env.beer_key
			@beerapi= HTTParty.get"http://api.brewerydb.com/v2/beers/?key=#{beer_key}&order=random&randomCount=1&abv='-10'"

			alco ={
			'beer' => @beerapi['data'][0]['name'],
			'description' =>@beerapi['data'][0]['description']
			}

			render json:alco
		end

	end
end