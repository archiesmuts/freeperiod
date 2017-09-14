Rails.application.routes.draw do

  devise_for :users

  resources :users do
    resources :memberships
  end
  resources :schools do
    resources :memberships, path: :users, module: :schools
    resources :registration_klasses
  end
  resources :memberships
  resources :courses do
    resources :registration_klasses
  end
  resources :grades do
    resources :courses
  end
  resources :subjects do
    resources :courses
  end
  root to: 'visitors#index'
end
