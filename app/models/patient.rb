class Patient < ApplicationRecord
  has_many :doctor_patients
  has_many :doctors, through: :doctor_patients
  has_many :hospitals, through: :doctors

  def over_eighteen
    if self.age >= 18
      return true
    else
      return false
    end
  end

  def self.alphabetize_by_name
    Patient.all.order(name: :asc)
  end
end
