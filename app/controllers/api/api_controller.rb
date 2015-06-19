module Api
	class ApiController < ApplicationController
		protect_from_forgery with: :null_session

		def soup
			render json: Soup.order("RANDOM()").first, except: [:created_at, :updated_at]
		end
		def word
			@wordapi = HTTParty.get"http://api.wordnik.com:80/v4/words.json/wordOfTheDay?api_key=6e479e8bd483a107c100e0844930329e50962240809ce765c"
			dictionary = {
					word => @wordapi['word'].capitalize,
					definition => @wordapi["note"]
			}

			render json: dictionary
		end
		def reddit
			@redditapi=HTTParty.get"https://www.reddit.com/top.json"
			top_post = {
					title => @redditapi['data']['children'][0]['data']['title'],
					permalink => @redditapi['data']['children'][0]['data']['permalink']
			}
			render json:top_post
		end

	end
end