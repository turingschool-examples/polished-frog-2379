class Patient < ApplicationRecord
  has_many :doctor_patients
  has_many :doctors, through: :doctor_patients

  def self.alphabetical
    # require 'pry'; binding.pry
    where("age >= 18").order("name ASC")
  end
end