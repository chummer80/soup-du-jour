Rails.application.routes.draw do
  namespace :api do
    get "soup", to: "api#soup", as: :soup
    get "word", to: "api#word", as: :word

  end
end
