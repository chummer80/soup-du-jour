Rails.application.routes.draw do
  namespace :api do
    get "soup", to: "api#soup", as: :soup
  end

  root 'application#index'

  get 'signup', to: 'users#new', as: :new_user
  post 'signup', to: 'users#create', as: :create_user

  get 'login', to: 'sessions#new', as: :new_session
  post 'login', to: 'sessions#create', as: :create_session
  get 'logout', to: 'sessions#destroy', as: :destroy_session
end
