module Api
	class ApiController < ApplicationController
		protect_from_forgery with: :null_session

		def soup
			soupdata = {
				title: "Absolutely Ultimate Potato Soup",
				image: "http://images.media-allrecipes.com/userphotos/250x250/00/16/85/168555.jpg",
				description: "I have made this for many whom have given it the title. This takes a bit of effort but is well worth it. Please note: for those who do not wish to use bacon, substitute 1/4 cup melted butter for the bacon grease and continue with the recipe. (I generally serve this soup as a special treat as it is not recommended for people counting calories.)",
				url: "http://allrecipes.com/Recipe/Absolutely-Ultimate-Potato-Soup/Detail.aspx?evt19=1&referringHubId=16369"
			}

			render json: soupdata
		end
	end
end