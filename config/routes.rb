Rails.application.routes.draw do
  devise_for :admins
  root to: "home#index"
  get "/search", to: "home#search"
  resources :users, only: :show

  namespace :admin do
    root to: "/admin/dashboards#index"
    resources :settings
    resources :tags
    resources :users, only: [:index, :show, :destroy]
    resources :uniposes, only: [:index, :show, :destroy]
    resources :chatwork_users, only: [:index, :show, :destroy]

    namespace :clones do
      resources :chatwork_users, only: :index
      resources :uniposes, only: :index
      resources :users, only: :index
    end

    namespace :updates do
      resources :users, only: :index
    end
  end
end
