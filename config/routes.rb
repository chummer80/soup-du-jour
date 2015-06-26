Rails.application.routes.draw do
  namespace :api do
    get ":morsel_type", to: "api#morsel", as: :morsel
  end

  root 'application#index'

  get 'signup', to: 'users#new', as: :new_user
  post 'signup', to: 'users#create', as: :create_user
  get 'settings', to: 'users#edit_settings', as: :edit_user_settings
  patch 'settings', to: 'users#update_settings', as: :update_user_settings
  get 'morsels', to: 'users#edit_morsels', as: :edit_user_morsels
  patch 'morsels', to: 'users#update_morsels', as: :update_user_morsels

  get 'login', to: 'sessions#new', as: :new_session
  post 'login', to: 'sessions#create', as: :create_session
  get 'logout', to: 'sessions#destroy', as: :destroy_session
end
