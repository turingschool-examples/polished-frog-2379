class Patient < ApplicationRecord
  validates_presence_of :name, :age

  has_many :doctor_patients
  has_many :doctors, through: :doctor_patients

  def self.adult_sort
   Patient.where("age >= 18").order(name: :asc)
  end
end