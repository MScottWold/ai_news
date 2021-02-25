Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "static_pages#root"
  
  namespace :admin do
    resources :articles, only: [:new, :edit, :show, :create, :update, :destroy]
    resource :session, only: [:new, :create, :destroy]
  end

  namespace :api, defaults: { format: :json } do
    resources :articles, only: [:index, :show]
    resources :authors, only: [:show]
  end
end
