Rails.application.routes.draw do
  namespace :api do
    get "soup", to: "api#soup", as: :soup
  end
end
