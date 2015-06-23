module MorselsHelper
	def self.get_soup_morsel_data
		soup_morsel = Soup.order("RANDOM()").first
		soup_morsel_data = {
			name: soup_morsel.name,
			image_url: soup_morsel.image_url,
			description: soup_morsel.description,
			recipe_url: soup_morsel.recipe_url
		}
		soup_morsel_data
	end

	def self.get_word_morsel_data
		word_key = Figaro.env.word_key
		word_api_data = HTTParty.get"http://api.wordnik.com:80/v4/words.json/wordOfTheDay?api_key=#{word_key}"
		word_morsel_data = {
			'word' => word_api_data['word'].capitalize,
			'definition' => word_api_data["note"]
		}
	end

	def self.get_reddit_morsel_data
		reddit_api_data = HTTParty.get"https://www.reddit.com/top.json"
		reddit_morsel_data = {
			'title' => reddit_api_data['data']['children'][0]['data']['title'],
			'permalink' => "http://www.reddit.com/" + reddit_api_data['data']['children'][0]['data']['permalink']
		}
	end

	def self.get_weather_morsel_data(zip_code)
		weather_key = Figaro.env.weather_key
		weather_api_data = HTTParty.get"http://api.wunderground.com/api/#{weather_key}/conditions/q/#{zip_code}.json"
		weather_morsel_data = {
			'location' => weather_api_data["current_observation"]["display_location"]['full'],
			'current_temp' => weather_api_data["current_observation"]["temperature_string"],
			'icon' =>  weather_api_data["current_observation"]["icon_url"]
		}
	end

	def self.get_restaurant_morsel_data(zip_code)
		# Pick the yelp business with a "best "match" ranking that corresponds to the current
		# day of the month. This way a top-31 restaurant will always be suggested, and it will 
		# never be the same restaurant that was just suggested recently.
		restaurant_rank = Time.zone.now.mday
		yelp_api_data = Yelp.client.search(
			zip_code, 
			{
				term: 'restaurants', 
				radius_filter: 8046, 	# 8046 meters = 5 miles
				limit: 1, 
				offset: restaurant_rank - 1
			}
		)

		begin
			restaurant_img = yelp_api_data.raw_data['businesses'][0]['image_url']
			# if image is named "ms.jpg", then it is the small version. Change it to "o.jpg".
			restaurant_img.gsub!(/ms\.jpg/, 'o.jpg')
		rescue
			restaurant_img = ""
		end

		restaurant_morsel_data ={
			'first_img' => restaurant_img,
			'bizname' => yelp_api_data.raw_data['businesses'][0]['name'],
			'rating' => yelp_api_data.raw_data['businesses'][0]['rating_img_url'],
			'comment' => yelp_api_data.raw_data['businesses'][0]['snippet_text'],
			'yelp_link' => yelp_api_data.raw_data['businesses'][0]['url']
		}
	end

	def self.get_beer_morsel_data
		beer_key = Figaro.env.beer_key
		beer_api_data = HTTParty.get"http://api.brewerydb.com/v2/beers/?key=#{beer_key}&order=random&randomCount=1&abv='-10'"

		beer_morsel_data = {
			'beer' => beer_api_data['data'][0]['name'],
			'description' => beer_api_data['data'][0]['description']
		}
	end

	def self.get_event_morsel_data(zip_code)
		events_key = Figaro.env.events_key
		today = Time.now.in_time_zone("America/Los_Angeles").strftime("%F")
		event_data = HTTParty.get"https://www.eventbriteapi.com/v3/events/search/?location.address=#{zip_code}&location.within=5mi&start_date.range_start=#{today}T00%3A00%3A35Z&start_date.range_end=#{today}T23%3A50%3A57Z&token=#{events_key}"

		event_morsel_data = {
				'name' => event_data['events'][0]['name']['text'],
				'description' => event_data['events'][0]['description']['text'],
				'event_pic' => event_data['events'][0]['logo']['url'],
				'event_url' => event_data['events'][0]['url']
		}
	end

	def self.get_recipe_morsel_data
		recipe_key = Figaro.env.recipe_key
		recipe_data = JSON.parse HTTParty.get"http://food2fork.com/api/search?sort=t&key=#{recipe_key}"
		recipe_index = rand(30)
		recipe_morsel_data = {

				'name' => recipe_data['recipes'][recipe_index]['title'],
				'image' => recipe_data['recipes'][recipe_index]['image_url'],
				'source' => recipe_data['recipes'][recipe_index]['source_url']
		}
	end

	def self.get_news_morsel_data
		news_key = Figaro.env.news_key
		news_data = HTTParty.get("http://api.nytimes.com/svc/topstories/v1/home.json?api-key=#{news_key}")

		news_morsel_data = {
				'title' => news_data['results'][0]['title'],
				'abstract' => news_data['results'][0]['abstract'],
				'image' => news_data['results'][0]['multimedia'][0]['url'],
				'source' => news_data['results'][0]['url']
		}
	end



	# Create an entry in the morsel table for the morsel type and zip code provided
	# This should only happen if such a morsel doesn't already exist
	def self.create_morsel(morsel_type, zip_code = "")
		case morsel_type
		when "soup"
			morsel_data = get_soup_morsel_data
		when "word"
			morsel_data = get_word_morsel_data
		when "reddit"
			morsel_data = get_reddit_morsel_data
		when "weather"
			morsel_data = get_weather_morsel_data(zip_code)
		when "restaurant"
			morsel_data = get_restaurant_morsel_data(zip_code)
		when "beer"
			morsel_data = get_beer_morsel_data
		when "event"
			morsel_data = get_event_morsel_data(zip_code)
		when "recipe"
			morsel_data = get_recipe_morsel_data
		when "news"
			morsel_data = get_news_morsel_data
		else
			raise "Unrecognized morsel type: #{morsel_type}"
		end

		morsel_params = {
			morsel_type: morsel_type,
			zip_code: zip_code,
			data: morsel_data.to_json
		}

		morsel = Morsel.create(morsel_params)

		if morsel.valid?
			morsel
		else
			raise "#{morsel_type} morsel could not be created!"
		end

		morsel
	end



	# This either retrieves the existing morsel that fits the search criteria,
	# or creates it if it doesn't exist yet.
	def self.get_morsel(morsel_type, zip_code = "")
		morsel = Morsel.find_by(morsel_type: morsel_type, zip_code: zip_code)

		if morsel.nil?
			morsel = create_morsel(morsel_type, zip_code)
		end

		morsel
	end
end
