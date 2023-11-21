Rails.application.routes.draw do
  root "tops#index"

  devise_for :users, controllers: {
    omniauth_callbacks: "omniauth_callbacks",
    registrations: "registrations",
    sessions: 'users/sessions'
  }
  devise_scope :user do
    get '/sign_in', to: 'users/sessions#new'
  end

  get 'terms', to: 'tops#terms'
  get 'privacy', to: 'tops#privacy'
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'users#destroy'

  post 'callback' => 'line_bot#callback'

  resource :user, only: %i[new create destroy]
  resource :profile, only: %i[show edit update] do
    collection do
      post :set_alarm
      delete :remove_alarm
    end
  end
  
  resources :progresses, only: [:create]
  resources :bookmarks, only: %i[create destroy]
  resources :categories, only: %i[index show] do
    resources :lessons, only: %i[index show] do
      collection do
        post :result
        get :result
      end
    end
  end

  namespace :admin do
    root to: 'dashboards#index'
    resources :users, only: [:index, :edit, :update, :destroy]
    resources :categories
    resources :courses
    resources :lessons do
      resources :answers, shallow: true
    end
  end
end
