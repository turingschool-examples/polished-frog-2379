class Hospital < ApplicationRecord
  has_many :doctors
  has_many :patient_doctors, through: :doctors
  has_many :patients, through: :patient_doctors

end