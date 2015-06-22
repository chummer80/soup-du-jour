require 'yelp'

Yelp.client.configure do |config|
	config.consumer_key = Figaro.env.yelp_consumer_key
	config.consumer_secret = Figaro.env.yelp_consumer_secret
	config.token = Figaro.env.yelp_token
	config.token_secret = Figaro.env.yelp_token_secret
end