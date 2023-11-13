Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :doctors, only: [:show]
  delete "doctors/:doctor_id/patients/:patient_id", to: "doctor_patients#destroy"
  resources :patients, only: [:index]
end
