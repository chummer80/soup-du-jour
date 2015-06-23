Rails.application.routes.draw do
  namespace :api do
    get "soup", to: "api#soup", as: :soup
    get "word", to: "api#word", as: :word
    get "reddit", to: "api#reddit", as: :reddit
    get "weather", to: "api#weather", as: :weather
    get "restaurant", to: "api#restaurant", as: :restaurant
    get "beer", to: "api#beer", as: :beer
    get "video", to: "api#video", as: :video
  end

  root 'application#index'

  get 'signup', to: 'users#new', as: :new_user
  post 'signup', to: 'users#create', as: :create_user

  get 'login', to: 'sessions#new', as: :new_session
  post 'login', to: 'sessions#create', as: :create_session
  get 'logout', to: 'sessions#destroy', as: :destroy_session
end
