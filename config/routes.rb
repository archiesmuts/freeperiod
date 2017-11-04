Rails.application.routes.draw do

  devise_for :users

  resources :users do
    resources :memberships
    resources :user_registrations
    resources :addresses, module: :users
    resources :goals, module: :users
  end

  resources :schools do
    resources :memberships, path: :users, module: :schools
    resources :addresses, module: :schools
    resources :goals, module: :schools
    resources :registration_klasses do
      member do
        get :select_faculty
      end
    end
    resources :fees
    resources :events
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
    resources :goals, module: :registration_klasses
  end

  resources :lesson_plans do
    resources :assessments
  end

  resources :assessments do
    resources :results
    resources :parts
  end

  resources :user_registrations do
    resources :results
    resources :pay_agreements
    resources :attendances, module: :user_registrations
    resources :goals, module: :user_registrations
  end

  resources :assessment_types do
    resources :assessment_tasks
  end

  resources :assessment_tasks

  resources :fees do
    resources :pay_agreements
  end

  resources :results do
    resources :comments, module: :results
  end

  resources :events do
    resources :comments, module: :events
    resources :addresses, module: :events
  end

  resources :goals do
    resources :action_plans do
      collection do
        patch :sort
      end
    end
  end

  resources :school_courses, only: :index

  root to: 'visitors#index'
end
