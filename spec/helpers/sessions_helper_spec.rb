require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the SessionsHelper. For example:
#
# describe SessionsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe SessionsHelper, :type => :helper do
  context "log_in" do
  	it "should save the user's id as the session id" do
  		user = FactoryGirl.create(:valid_user)
  		log_in(user)
  		expect(session[:user_id]).to eq(user.id)
  	end

  	it "should remember the user using cookies" do
  		user = FactoryGirl.create(:valid_user)
  		log_in(user)
  		expect(cookies.signed[:user_id]).to eq(user.id)
  		expect(cookies[:remember_token]).to eq(user.remember_token)
  	end
  end

  context "log_out" do
  	it "should reset session ID" do
  		user = FactoryGirl.create(:valid_user)
  		log_in(user)
  		log_out
  		expect(session[:user_id]).to be_nil
  	end

  	it "should reset current user" do
  		user = FactoryGirl.create(:valid_user)
  		log_in(user)
  		log_out
  		expect(current_user).to be_nil
  	end

  	it "should remove session-tracking cookies" do
  		user = FactoryGirl.create(:valid_user)
  		log_in(user)
  		log_out
  		expect(cookies.signed[:user_id]).to be_nil
  		expect(cookies[:remember_token]).to be_nil
  	end
  end

  context "current_user" do
  	it "should return the currently logged in user object" do
  		user = FactoryGirl.create(:valid_user)
  		log_in(user)
  		expect(current_user).to eq(user)
  	end

  	it "should return nil if there is no user logged in" do
  		expect(current_user).to be_nil
  	end

  	it "should return the currently logged in user object if there is no session ID but there is a cookie (i.e. browser was restarted) " do
  		user = FactoryGirl.create(:valid_user)
  		log_in(user)
  		session[:user_id] = nil
  		expect(current_user).to eq(user)
  	end
  end

  context "logged_in?" do
  	it "should return true if a user is logged in" do
  		user = FactoryGirl.create(:valid_user)
  		log_in(user)
  		expect(logged_in?).to be true
  	end

  	it "should return true if a user has not yet logged in" do
  		user = FactoryGirl.create(:valid_user)
  		expect(logged_in?).to be false
  	end

  	it "should return true if a user has logged out" do
  		user = FactoryGirl.create(:valid_user)
  		log_in(user)
  		log_out
  		expect(logged_in?).to be false
  	end

  	it "should return true if user has not logged out, but browser has been restarted" do
  		user = FactoryGirl.create(:valid_user)
  		log_in(user)
  		session[:user_id] = nil
  		expect(logged_in?).to be true
  	end
  end

  context "authorize" do
  	it "should set flash alert to an error message if no user is logged in" do
  		authorize
  		expect(flash[:alert]).to eq("You must log in to view that page")
  	end
  end

  context "unauthorize" do
  	it "should set flash alert to an error message if a user is logged in" do
  		user = FactoryGirl.create(:valid_user)
  		log_in(user)
  		unauthorize
  		expect(flash[:alert]).to eq("You cannot visit that page while you are logged in")
  	end
  end
end
