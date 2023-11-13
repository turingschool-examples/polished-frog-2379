class Patient < ApplicationRecord
  has_many :doctor_patients
  has_many :doctors
end