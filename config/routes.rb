Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "static_pages#root"
  
  namespace :admin do
    resources :articles, only: [:new, :edit, :show, :index, :create, :update, :destroy]
    resource :session, only: [:new, :create, :destroy]
  end

  namespace :api, defaults: { format: :json } do
    resources :articles, only: [:index, :show] do
      resources :comments, only: [:index, :create]
      member do 
        post 'favorite'
        post 'unfavorite'
      end
    end
    resources :authors, only: [:show] do 
      member do
        get :articles, to: 'articles#author_articles'
      end
    end
    resources :users, only: [:create, :destroy]
    resource :session, only: [:create, :destroy]
  end
end
