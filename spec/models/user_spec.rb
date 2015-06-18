require 'rails_helper'

RSpec.describe User, :type => :model do
  context "email" do
  	it "should require prefix to be present" do
  		user = FactoryGirl.build(:valid_user, email: "@gmail.com")
  		expect(user.save).to be false
  	end

  	it "should require domain to be present" do
  		user = FactoryGirl.build(:valid_user, email: "mike@.com")
  		expect(user.save).to be false
  	end

  	it "should require suffix to be present" do
  		user = FactoryGirl.build(:valid_user, email: "mike@gmail")
  		expect(user.save).to be false
  	end

  	it "should require email to be unique in the user database" do
  		FactoryGirl.create(:valid_user)
  		user = FactoryGirl.build(:valid_user, password: "123456")
  		expect(user.save).to be false
  	end
  end

  context "password" do
  	it "should be at least 6 characters long" do
  		user = FactoryGirl.build(:valid_user, password: "12345")
  		expect(user.save).to be false

  		user = FactoryGirl.build(:valid_user, password: "123456")
  		expect(user.save).to be true
  	end

  	it "should require a matching password confirmation when being created" do
  		user = FactoryGirl.build(:valid_user, password: "123456", password_confirmation: "654321")
  		expect(user.save).to be false
  	end
  end

  context "zip_code" do
  	it "should allow blank string" do
  		user = FactoryGirl.build(:valid_user, zip_code: "")
  		expect(user.save).to be true
  	end

  	it "should otherwise require a 5-character string" do
  		user = FactoryGirl.build(:valid_user, zip_code: "1234")
  		expect(user.save).to be false

  		user = FactoryGirl.build(:valid_user, zip_code: "123456")
  		expect(user.save).to be false

  		user = FactoryGirl.build(:valid_user, zip_code: "12345")
  		expect(user.save).to be true
  	end

  	it "should require all characters to be digits" do
  		user = FactoryGirl.build(:valid_user, zip_code: "1234A")
  		expect(user.save).to be false
  	end
  end
end
