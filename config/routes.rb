Rails.application.routes.draw do
  devise_for :admins
  root to: "home#index"
  get "/load_chatwork_users", to: "home#load_chatwork_users"
  get "/load_unipos_users", to: "home#load_unipos_users"
  get "/search", to: "home#search"
  resources :users

  namespace :admin do
    root to: "/admin/dashboards#index"

    resources :uniposes, only: [:index, :show, :destroy]
    post "/uniposes", to: "/admin/uniposes#clone_uniposes", as: "clone_uniposes"

    resources :users, only: [:index, :show, :destroy]
    post "/users", to: "/admin/users#clone_users_from_unipos", as: "clone_users_from_unipos"
    put "/users", to: "/admin/users#update_users_infomation", as: "update_users_infomation"

    get "/chatwork", to: "/admin/chatwork_users#index"
    get "/chatwork/:id", to: "/admin/chatwork_users#show", as: "show_chatwork_user"
    delete "/chatwork/:id", to: "/admin/chatwork_users#destroy", as: "delete_chatwork_user"
    post "/chatwork", to: "/admin/chatwork_users#clone_users_from_chatwork", as: "clone_users_from_chatwork"
  end
end
