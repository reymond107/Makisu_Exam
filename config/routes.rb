Rails.application.routes.draw do
  devise_for :users
  # devise_for :users
  root to: 'searches#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post 'website' => 'home#website'
  get 'save' => 'home#new'
  resources :searches
end
