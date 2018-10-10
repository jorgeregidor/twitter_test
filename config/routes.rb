Rails.application.routes.draw do
  resources :comments, only: [:new, :create, :show]
  devise_for :users
  
  root to: "comments#index"
end
