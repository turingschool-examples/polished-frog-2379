class Patient < ApplicationRecord
  has_many :doctor_patients
  has_many :doctors, through: :doctor_patients

  def self.adult_patients
    order(:name).where("age > 18").pluck(:name)
  end
end