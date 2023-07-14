Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "tops#index"
  get 'terms', to: 'tops#terms'
  get 'privacy', to: 'tops#privacy'

end
