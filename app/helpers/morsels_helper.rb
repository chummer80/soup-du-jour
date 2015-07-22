module MorselsHelper
	
	# This is the central list of all morsels available in our API.
	# A list can be retrieved by passing in a filter: "all", "localized", or "general"
	def self.get_morsel_list(filter = "all")
		general_morsels = %w(
			soup
			word
			reddit
			beer
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

		localized_morsels = %w(				
			weather
			restaurant				
			event
		)

		case filter
		when "all"
			return general_morsels + localized_morsels
		when "localized"
			return localized_morsels
		when "general"
			return general_morsels
		else
			raise "unrecognized morsel list filter: #{filter.to_s}"
		end
	end


	# This either retrieves the existing morsel that fits the search criteria,
	# or creates it if it doesn't exist yet.
	def self.get_morsel(morsel_type, zip_code)
		morsel = Morsel.find_by(morsel_type: morsel_type, zip_code: zip_code)

		if morsel.nil?
			morsel = create_morsel(morsel_type, zip_code)
		end

		morsel
	end


private	

	
	# Create an entry in the morsel table for the morsel type and zip code provided
	# This should only happen if such a morsel doesn't already exist
	def self.create_morsel(morsel_type, zip_code)
		localized_morsel_list = get_morsel_list("localized")
		general_morsel_list = get_morsel_list("general")

		if localized_morsel_list.include?(morsel_type)
			morsel_data = send("get_#{morsel_type}_morsel_data", zip_code)
		elsif general_morsel_list.include?(morsel_type)
			morsel_data = send("get_#{morsel_type}_morsel_data")
		else
			raise "Unrecognized morsel type: #{morsel_type}"
		end

		if morsel_data.nil?
			return nil
		else			
			morsel_params = {
				morsel_type: morsel_type,
				zip_code: zip_code,
				data: morsel_data.to_json
			}

			morsel = Morsel.create(morsel_params)

			# use this line instead of the 'create' line for testing.
			# this one won't save morsels in the database, so api calls will happen every time.
			# Remember to delete or reset all morsels after uncommenting this line.
			# morsel = Morsel.new(morsel_params)  

			if morsel.valid?
				return morsel
			else
				raise "#{morsel_type} morsel could not be created!"
				return nil
			end

			return morsel
		end
	end

#API methods
	#used ruby rescue to add default text/pictures to prevent certain key/value pairs from error-out (ie eventbrite photos will error without a default picture)
	# added another rescue to have the tiles return nil instead of error-out
	def self.get_soup_morsel_data
		soup_index = Time.zone.now.mday - 1
		soup_morsel = Soup.all[soup_index]
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
		begin
		word_api_data = HTTParty.get("http://api.wordnik.com:80/v4/words.json/wordOfTheDay?api_key=#{word_key}", timeout:15)
		word_morsel_data = {
			'word' => word_api_data['word'].capitalize,
			'definition' => word_api_data['definitions'][0]['text'],
			'part_of_speech' => word_api_data['definitions'][0]['partOfSpeech'],
			'url' => "https://www.wordnik.com/words/#{word_api_data['word']}"
		}
		rescue
			nil
		end
	end

	def self.get_reddit_morsel_data
		begin
			reddit_api_data = HTTParty.get("https://www.reddit.com/hot.json", timeout: 15)
			reddit_posts = reddit_api_data['data']['children']
			reddit_post_data = nil
			reddit_posts.each do |post|
				reddit_post_data = post['data']

				# prevent NSFW posts from being used for the morsel
				break unless reddit_post_data['over_18']
			end

			begin
				reddit_pic = reddit_post_data['preview']['images'][0]['source']['url']
			rescue
				reddit_pic = "https://www.redditstatic.com/about/assets/reddit-alien.png"
			end

			reddit_morsel_data = {
				'title' => reddit_post_data['title'],
				'image' => reddit_pic,
				'permalink' => "http://www.reddit.com/" + reddit_post_data['permalink']
			}
		rescue
			return nil
		end
	end

	def self.get_weather_morsel_data(zip_code)
		weather_key = Figaro.env.weather_key
		begin
			weather_api_data = HTTParty.get("http://api.wunderground.com/api/#{weather_key}/conditions/q/#{zip_code}.json", timeout: 15)

			rain_words = %w(Drizzle Rain Thunderstorm Precipitation Spray Squall)
			rain_regex = Regexp.union(*rain_words)
			snow_words = %w(Snow Ice Hail)
			snow_regex = Regexp.union(*snow_words)
			fog_words = %w(Fog Mist Haze)
			fog_regex = Regexp.union(*fog_words)
			dust_words = %w(Dust Smoke Sand Ash)
			dust_regex = Regexp.union(*dust_words)
			clear_words = %w(Clear)
			clear_regex = Regexp.union(*clear_words)
			cloud_words = %w(Cloud Overcast)
			cloud_regex = Regexp.union(*cloud_words)

			begin
				weather_type = weather_api_data["current_observation"]["weather"]
			rescue
				weather_type = "Unknown"
			end

			if rain_regex === weather_type
				weather_img = "http://headsup.boyslife.org/files/2012/12/rain.jpg"
			elsif snow_regex === weather_type
				weather_img = "http://i.ytimg.com/vi/ea1GMrjjJ1A/maxresdefault.jpg"
			elsif fog_regex === weather_type
				weather_img = "http://www.sarahannrogers.com/wp-content/uploads/2013/01/fog.jpg"
			elsif dust_regex === weather_type
				weather_img = "http://i.imwx.com/common/articles/images/orangecitystreet_650x366.jpg"
			elsif clear_regex === weather_type
				weather_img = "http://www.pardaphash.com/uploads/images/660/bright-future-74300.jpg"
			elsif cloud_regex === weather_type
				weather_img = "http://www.sitkanature.org/wordpress/wp-content/gallery/20100923/20100923-overcast-2.jpg"
			else
				# default pic if weather type is something else
				weather_img = "http://anewscafe.com/wp-content/uploads/2011/03/rainbow-weather.jpg"
			end

			weather_morsel_data = {
				'location' => weather_api_data["current_observation"]["display_location"]['full'],
				'current_temp' => weather_api_data["current_observation"]["temperature_string"],
				'image_url' => weather_img,
				'description' => weather_type,
				'url' => weather_api_data["current_observation"]["forecast_url"]
			}
		rescue
			return nil
		end
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
			yelp_rating = yelp_api_data.raw_data['businesses'][0]['rating_img_url']
			yelp_comment = yelp_api_data.raw_data['businesses'][0]['snippet_text']

		rescue
			yelp_rating = ""
			restaurant_img = "http://www.bonappetit.com/wp-content/uploads/2011/03/empty-restaurant-table-reviews-critis_484.jpg"
			yelp_comment = ""
		end

		begin
		restaurant_morsel_data ={
			'first_img' => restaurant_img,
			'bizname' => yelp_api_data.raw_data['businesses'][0]['name'],
			'rating' => yelp_api_data.raw_data['businesses'][0]['rating_img_url'],
			'comment' => yelp_api_data.raw_data['businesses'][0]['snippet_text'],
			'yelp_link' => yelp_api_data.raw_data['businesses'][0]['url']
		}
		rescue
			return nil
		end
	end

	def self.get_beer_morsel_data
		beer_key = Figaro.env.beer_key
		begin
			beer_api_data = HTTParty.get("http://api.brewerydb.com/v2/beers/?key=#{beer_key}&order=random&randomCount=1&abv='-10'", timeout: 15)
			begin
				beer_pic = beer_api_data['data'][0]['labels']['large']
				beer_desc = beer_api_data['data'][0]['description']
			rescue
				beer_pic = "http://lexingtonbeerworks.com/site/wp-content/uploads/2014/05/Craft-Beer.jpg"
				beer_desc = ""
			end

			beer_morsel_data = {
				'image' => beer_pic,
				'beer' => beer_api_data['data'][0]['name'],
				'description' => beer_desc
			}
		rescue
			return nil
		end
	end

	def self.get_event_morsel_data(zip_code)
		events_key = Figaro.env.events_key
		today = Time.now.in_time_zone("America/Los_Angeles").strftime("%F")
		begin
			event_data = HTTParty.get("https://www.eventbriteapi.com/v3/events/search/?location.address=#{zip_code}&location.within=5mi&start_date.range_start=#{today}T00%3A00%3A35Z&start_date.range_end=#{today}T23%3A50%3A57Z&token=#{events_key}", timeout:15)
			begin
				event_img = event_data['events'][0]['logo']['url']
			rescue
				event_img = "http://files.itproportal.com/wp-content/uploads/2014/07/Eventbrite_logo_640_400_contentfullwidth.png"
			end
			event_morsel_data = {
				'name' => event_data['events'][0]['name']['text'],
				'description' => event_data['events'][0]['description']['text'],
				'event_pic' => event_img,
				'event_url' => event_data['events'][0]['url']
			}
		rescue
			return nil
		end
	end

	def self.get_recipe_morsel_data
		recipe_key = Figaro.env.recipe_key
		begin
			recipe_data = JSON.parse HTTParty.get("http://food2fork.com/api/search?sort=t&key=#{recipe_key}", timeout:15)
			recipe_index = rand(30)
			begin
				recipe_image = recipe_data['recipes'][recipe_index]['source_url']
			rescue
				recipe_image = ""
			end
			recipe_morsel_data = {
				'name' => recipe_data['recipes'][recipe_index]['title'],
				'image' => recipe_data['recipes'][recipe_index]['image_url'],
				'source' => recipe_data['recipes'][recipe_index]['source_url']
			}
		rescue
			return nil
		end
	end
	
	def self.get_video_morsel_data
		# Youtube channel "#PopularOnYoutube" has a playlist called "Popular Right Now".
		# Grab the first video on that playlist as our video morsel.
		playlist = Yt::Playlist.new(id: 'PLrEnWoR732-BHrPp_Pm8_VleD68f9s14-')
		video = playlist.playlist_items.first

		# this method gives the default-sized image. change it to the max-res image.
		thumbnail_url = video.thumbnail_url
		thumbnail_url.gsub!(/default\.jpg/, "maxresdefault.jpg")

		video_morsel_data = {
			title: video.title,
			description: video.description,
			image_url: thumbnail_url,
			video_url: "https://www.youtube.com/embed/#{video.video_id}"
		}
	end
	
	def self.get_musicvideo_morsel_data
		# Youtube channel "#PopularOnYoutube" has a playlist called "Popular Right Now".
		# Grab the first musicvideo on that playlist as our musicvideo morsel.
		playlist = Yt::Playlist.new(id: 'PLFgquLnL59akA2PflFpeQG9L01VFg90wS')
		musicvideo = playlist.playlist_items.first

		# this method gives the default-sized image. change it to the max-res image.
		thumbnail_url = musicvideo.thumbnail_url
		thumbnail_url.gsub!(/default\.jpg/, "maxresdefault.jpg")

		musicvideo_morsel_data = {
			title: musicvideo.title,
			description: musicvideo.description,
			image_url: thumbnail_url,
			video_url: "https://www.youtube.com/embed/#{musicvideo.video_id}"
		}
	end

	def self.get_news_morsel_data
		news_key = Figaro.env.news_key
		begin
			news_data = HTTParty.get("http://api.nytimes.com/svc/topstories/v1/home.json?api-key=#{news_key}", timeout: 15)

			begin
				news_img = news_data['results'][0]['multimedia'][0]['url']
				# if image is named "ms.jpg", then it is the small version. Change it to "o.jpg".
				news_img.gsub!(/thumbStandard.*/, 'master675.jpg')
			rescue
				news_img = "http://static1.squarespace.com/static/5399cc0ae4b0705199b37aa3/5399e8a2e4b0f44ec1b1e21e/545a0216e4b05115df2de008/1429793622682"
			end
			news_morsel_data = {
				'title' => news_data['results'][0]['title'],
				'abstract' => news_data['results'][0]['abstract'],
				'image' => news_img,
				'source' => news_data['results'][0]['url']
			}
		rescue
			return nil
		end
	end

	def self.get_trivia_morsel_data
		trivia_data = HTTParty.get("https://doubleordonate.herokuapp.com/api/questions")
		index = rand(trivia_data.length)
		trivia_morsel_data = {
			'id' => trivia_data[index]['id'],
			'question' => trivia_data[index]['text'],
			'answer1' => trivia_data[index]['answer_1'],
			'answer2' => trivia_data[index]['answer_2'],
			'answer3' => trivia_data[index]['answer_3'],
			'answer4' => trivia_data[index]['answer_4'],
			'correct' => trivia_data[index]['correct_answer']
		}
	end

	def self.get_deal_morsel_data
		# sanitizer = Rails::Html::FullSanitizer.new
		sqoot_key = Figaro.env.sqoot_key
		begin
			sqoot_data = HTTParty.get("http://api.sqoot.com/v2/deals?api_key=#{sqoot_key}&online=true&order=updated_at_desc", timeout:15)
			deal_morsel_data={
				'title' => sqoot_data['deals'][0]['deal']['short_title'],
				'image' => sqoot_data['deals'][0]['deal']['image_url'],
				'description' => sqoot_data['deals'][0]['deal']['title'],
				'source' => sqoot_data['deals'][0]['deal']['untracked_url']
			}
		rescue
			return nil
		end
	end

	def self.get_photo_morsel_data
		instagram_key = Figaro.env.instagram_key
		begin
			instagram_data = HTTParty.get("https://api.instagram.com/v1/media/popular?client_id=#{instagram_key}", timeout:15)
			photo_index = nil
			# make sure we use a photo, not a video
			instagram_data['data'].each_index do |index|
				media_item = instagram_data['data'][index]
				if media_item['type'] == "image"
					photo_index = index
					break
				end
			end
			photo_morsel_data = {
				url: instagram_data['data'][photo_index]['link'],
				username: instagram_data['data'][photo_index]['user']['username'],
				image_url: instagram_data['data'][photo_index]['images']['standard_resolution']['url'],
				caption: instagram_data['data'][photo_index]['caption']['text']
			}
		rescue
			return nil
		end
	end

	def self.get_view_morsel_data
		instagram_key = Figaro.env.instagram_key
		begin
			instagram_data = HTTParty.get("https://api.instagram.com/v1/users/1988768/media/recent?client_id=#{instagram_key}", timeout:15)
			photo_index = nil
			# make sure we use a photo, not a video
			instagram_data['data'].each_index do |index|
				media_item = instagram_data['data'][index]
				if media_item['type'] == "image"
					photo_index = index
					break
				end
			end
			view_morsel_data = {
				url: instagram_data['data'][photo_index]['link'],
				image_url: instagram_data['data'][photo_index]['images']['standard_resolution']['url'],
				caption: instagram_data['data'][photo_index]['caption']['text']
			}
		rescue
			return nil
		end
	end

	def self.get_charity_morsel_data
		just_giving_key = Figaro.env.just_giving_key
		begin
			charity_list_data = HTTParty.get("https://api.justgiving.com/#{just_giving_key}/v1/charity/search?format=json", timeout: 15)
			# get a different charity each day of the month
			charity_index = Time.zone.now.mday % 15
			charity_id = charity_list_data['charitySearchResults'][charity_index]['charityId']

			# using the id number taken out of the charity list, get more info on that charity
			charity_api_data = HTTParty.get("https://api.justgiving.com/#{just_giving_key}/v1/charity/#{charity_id}?format=json")
			charity_morsel_data = {
				name: charity_api_data['name'],
				description: charity_api_data['description'],
				image_url: charity_api_data['logoAbsoluteUrl'],
				url: charity_api_data['websiteUrl']
			}
		rescue
			return nil
		end
	end
end
