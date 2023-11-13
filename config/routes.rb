Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/doctors/:id", to: "doctors#show"

  get "/patients", to: "patients#index"

  delete "/doctors/:doctor_id/patients/:patient_id", to: "doctor_patients#destroy"
end
