Rails.application.routes.draw do
  resources :drinks
  devise_for :users
  root 'drinks#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
