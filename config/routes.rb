Rails.application.routes.draw do

  devise_for :users

  resources :users do
    resources :memberships
  end
  resources :schools do
    resources :memberships, path: :users, module: :schools
  end
  resources :memberships
  root to: 'visitors#index'
end
