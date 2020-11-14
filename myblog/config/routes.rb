Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  resources :categories
  resources :shops
  resources :diaries
  resources :articles


  namespace :api, {format: 'json'} do
    namespace :v1 do
      resources :articles, only: [:index, :show]
      resources :product, only: [:index, :show]
    end
  end

  root "welcome#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
