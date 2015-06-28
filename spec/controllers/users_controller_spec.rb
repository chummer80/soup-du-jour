require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  it "should return new view for new method" do

    get :new

    expect(response).to render_template(:new)
  end

  it "new creates a new user" do
    get :new

    expect(assigns(:user)).to be_a_new(User)
  end

  # it "redirects to root path after user registers correctly" do
  #   FactoryGirl.build(:valid_user).save
  #   post :create, {user:
  #                      {
  #                          email: "test@test.com",
  #                          password: "asdfasdf"
  #                      }
  #               }
  #
  #   expect(response).to redirect_to(root_path)
  # end


end
