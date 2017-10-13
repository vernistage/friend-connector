Rails.application.routes.draw do
  get "members/member_results", to: 'members#member_results'
  resources :members, only: [:new, :show, :index, :create]
  resources :friendships, only: [:create]
end
