Rails.application.routes.draw do
  namespace :admin do
    resources :profiles
    resources :users
  end
  devise_for :users
  root 'home/home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
