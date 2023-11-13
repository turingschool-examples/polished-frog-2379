Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :hospitals, only: [:show]
  resources :doctors do
    resources :doctor_patients, only: [:destroy]
  end
  resources :patients, only: [:index]
end
