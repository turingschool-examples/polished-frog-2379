Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :patients, only: [:index]

  resources :doctors, only: [:show] do
    resources :patients, controller: "doctor_patients", only: [:destroy]
  end
end
