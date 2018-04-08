Rails.application.routes.draw do
  root to: "home#index"
  get "/load_chatwork_users", to: "home#load_chatwork_users"
  get "/load_unipos_users", to: "home#load_unipos_users"

  namespace :admin do
    root to: "/admin/chatwork_users#index"
    get "/chatwork", to: "/admin/chatwork_users#index"
    get "/chatwork/:id", to: "/admin/chatwork_users#show", as: "show_chatwork_user"
    delete "/chatwork/:id", to: "/admin/chatwork_users#destroy", as: "delete_chatwork_user"
    post "/chatwork", to: "/admin/chatwork_users#load_users_from_chatwork", as: "load_user_from_chatwork"
  end
end
