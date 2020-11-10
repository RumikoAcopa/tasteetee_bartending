Rails.application.routes.draw do
  resources :ingredients
  #devise_for :admins
  devise_for :users
  resources :orders, only: [:index, :show, :edit, :update, :delete]
  resources :drinks, only: [:index,:show]

  namespace :admin do

    get '/', to: 'admin#index'
    get '/show', to: 'admin#show'
    resources :users, param: :slug, only: [:edit, :update, :destroy]
    resources :drinks, only: [:new, :create, :edit, :update, :destroy]
    resources :orders,  only: [:new, :create, :edit, :update, :destroy]
  end
  root 'users#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
end
