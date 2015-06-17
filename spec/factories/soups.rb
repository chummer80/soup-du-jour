FactoryGirl.define do
  factory :valid_soup, class: Soup do
  	name "Test Soup"
  	image_url "http://test"
  	description "sample description for test soup"
  	recipe_url "http://test"
  end
end
