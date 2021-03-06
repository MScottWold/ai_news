Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "static_pages#root"
  
  get '/about', to: "static_pages#about"
  get '/privacy', to: "static_pages#privacy"

  namespace :admin do
    resources :articles, only: [:new, :edit, :show, :index, :create, :update, :destroy]
    resources :photos, only: [:new, :edit, :show, :index, :create, :update, :destroy]
    resource :session, only: [:new, :create, :destroy]
  end

  namespace :api, defaults: { format: :json } do
    resources :articles, only: [:index, :show] do
      collection do
        get 'front_page'
      end
      member do 
        post 'favorite'
        post 'unfavorite'
      end
      resources :comments, only: [:index, :create]
    end
    resources :authors, only: [:show] do 
      member do
        get :articles, to: 'articles#author_articles'
      end
    end
    resources :users, only: [:create]
    resource :session, only: [:create, :destroy]
  end
end
