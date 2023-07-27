Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "tops#index"
  get 'terms', to: 'tops#terms'
  get 'privacy', to: 'tops#privacy'
  
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  resources :users, only: %i[new create]
  resources :categories, only: %i[index show] do
    resources :lessons, only: %i[index show] do
      collection do
        post :result
        get :result
      end
    end
  end

end
