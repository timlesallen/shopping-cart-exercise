Rails.application.routes.draw do
  get 'carts/index'
  root 'carts#index'
  resources :cart_items, only: [:create, :update, :destroy]


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
