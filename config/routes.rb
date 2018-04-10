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

    get "/unipos", to: "/admin/unipos_users#index"
    get "/unipos/:id", to: "/admin/unipos_users#show", as: "show_unipos_user"
    delete "/unipos/:id", to: "/admin/unipos_users#destroy", as: "delete_unipos_user"
    post "/unipos", to: "/admin/unipos_users#load_users_from_unipos", as: "load_user_from_unipos"
  end
end
