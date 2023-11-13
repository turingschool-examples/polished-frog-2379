Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # config/routes.rb

 resources :doctors, only: [:show] do
    resources :doctor_patients, only: [:destroy]
  end

  resources :patients, only: [:index]

end
