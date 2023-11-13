class Patient < ApplicationRecord
  has_many :patient_doctors
  has_many :doctors, through: :patient_doctors
  has_many :hospitals, through: :doctors


end
