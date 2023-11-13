class Patient < ApplicationRecord
  has_many :patient_doctors
  has_many :doctors, through: :patient_doctors

  validates :name, presence: true
  validates :age, presence: true
end
