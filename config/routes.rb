Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # doctor
  get "/doctors/:doctor_id", to: "doctors#show"

  # doctor_patients
  delete "/doctors/:doctor_id/patients/:patient_id", to: "doctor_patients#destroy"

  # patients 
  get "/patients", to: "patients#index" 
end
