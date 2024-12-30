Rails.application.routes.draw do
  ActiveAdmin.routes(self)

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # OAuth authentication
  get "auth/google_oauth2/callback", to: "admin/oauth_sessions#google"
  get "auth/destroy", to: "admin/oauth_sessions#destroy"

  # Defines the root path route ("/")
  root to: "static_pages#root"

  get "/about", to: "static_pages#about"
  get "/privacy", to: "static_pages#privacy"

  namespace :api, defaults: { format: :json } do
    resources :articles, only: [:index, :show] do
      collection do
        get "front_page"
      end

      resources :comments, only: [:index, :create]
      post :favorites, to: "favorites#create"
      delete :favorites, to: "favorites#destroy"
    end

    resources :authors, only: [:show] do
      member do
        get :articles, to: "articles#author_articles"
      end
    end

    resources :users, only: [:create]
    resource :session, only: [:create, :destroy]
  end
end
