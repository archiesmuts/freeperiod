Rails.application.routes.draw do

  devise_for :users

  resources :users do
    resources :memberships
    resources :user_registrations
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

  resources :registration_klasses do
    resources :assessment_tasks
    resources :user_registrations
    resources :lesson_plans
  end

  resources :lesson_plans do
    resources :assessments
  end
  resources :assessment_tasks

  resources :assessments do
    resources :results
    resources :parts
  end

  resources :user_registrations do
    resources :results
  end

  resources :assessment_types do
    resources :assessment_tasks
  end
  resources :assessment_tasks
  resources :school_courses, only: :index

  root to: 'visitors#index'
end
