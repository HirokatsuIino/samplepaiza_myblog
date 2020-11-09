Rails.application.routes.draw do
  resources :categories
  resources :shops
  resources :diaries
  resources :articles

  root "shops#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
