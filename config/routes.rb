Rails.application.routes.draw do
  root to: "home#index"
  get "/load_chatwork_users", to: "home#load_chatwork_users"
  get "/load_unipos_users", to: "home#load_unipos_users"
end
