require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do

  it "new creates a new user" do
    get :new

    expect(assigns(:user)).to be_a_new(User)
  end

  it "should return new view for new method" do
    get :new
    expect(response).to render_template(:new)
  end


  it "destroys the session when logging a user out" do
    delete :destroy
    expect(assigns(:user)).to be_nil
  end

  it "should not log in user with incorrect password" do
    FactoryGirl.build(:valid_user).save
    post :create, {user:
                       {
                           username: "test@test.com",
                           password: "a23df"
                       }
                }
    expect(session[:user_id]).to be_nil
    expect(response).to render_template(:new)
  end
  it "should log in user with correct username and password" do
    FactoryGirl.build(:valid_user).save
    post :create, {user:
                       {
                           email: "test@test.com",
                           password: "asdfasdf"
                       }
                }
    expect(session[:user_id]).to be
    expect(User.find(session[:user_id])).to be
    expect(response).to redirect_to(root_path)
  end


  # it "Should redirect to users page when logging a user out" do
  #   FactoryGirl.build(:valid_user).save
  #   post :create, {user:
  #                      {
  #                          email: "test@test.com",
  #                          password: "asdfasdf",
  #                      password_confirmation: "asdfasdf"
  #                      }
  #               }
  #   get :destroy
  #   expect(response).to eq(:destroy_session)
  #   end
end
