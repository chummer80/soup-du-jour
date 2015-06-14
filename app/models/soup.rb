class Soup < ActiveRecord::Base
	validates :name, :image_url, :description, :recipe_url, presence: true
	validates :name, uniqueness: true
end
