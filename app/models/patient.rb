class Patient < ApplicationRecord
  has_many :patient_doctors
  has_many :doctors, through: :patient_doctors
  has_many :hospitals, through: :doctors

  def self.alphebetized_adults
    Patient.where('age > 18').order(:name)
  end
end
