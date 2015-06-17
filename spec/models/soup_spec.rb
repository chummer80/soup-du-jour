require 'rails_helper'

RSpec.describe Soup, :type => :model do
  context "name" do
	  it "must exist" do
	  	soup = FactoryGirl.build(:valid_soup, name: nil)
	  	expect(soup.save).to be false
	  end
	  it "must not be blank" do
	  	soup = FactoryGirl.build(:valid_soup, name: "")
	  	expect(soup.save).to be false
	  end
  end
  context "image_url" do
	  it "must exist" do
	  	soup = FactoryGirl.build(:valid_soup, image_url: nil)
	  	expect(soup.save).to be false
	  end
	  it "must not be blank" do
	  	soup = FactoryGirl.build(:valid_soup, image_url: "")
	  	expect(soup.save).to be false
	  end
  end
  context "description" do
	  it "must exist" do
	  	soup = FactoryGirl.build(:valid_soup, description: nil)
	  	expect(soup.save).to be false
	  end
	  it "must not be blank" do
	  	soup = FactoryGirl.build(:valid_soup, description: "")
	  	expect(soup.save).to be false
	  end
  end
  context "recipe_url" do
	  it "must exist" do
	  	soup = FactoryGirl.build(:valid_soup, recipe_url: nil)
	  	expect(soup.save).to be false
	  end
	  it "must not be blank" do
	  	soup = FactoryGirl.build(:valid_soup, recipe_url: "")
	  	expect(soup.save).to be false
	  end
  end
end
