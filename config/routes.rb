Rails.application.routes.draw do
  resources :members, only: [:new, :show, :index, :create, :destroy]
  resources :friendships, only: [:create]
end
