Rails.application.routes.draw do
  root to: "home#index"
  get "/load_chatword_user", to: "home#load_chatword_user"
end
