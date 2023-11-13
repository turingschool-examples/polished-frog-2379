class Patient < ApplicationRecord
  has_many :doctor_patients
  has_many :doctors, through: :doctor_patients
  
  def adult
    self.age >= 18
  end

  def self.alphabetize
    self.all.order(name: :asc)
  end
end