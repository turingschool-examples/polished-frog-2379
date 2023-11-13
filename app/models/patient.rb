class Patient < ApplicationRecord
  has_many :patient_doctors
  has_many :doctors, through: :patient_doctors

  def self.adult_patients
    where("age > 18")
  end

  def self.order_by_name
    order("name ASC")
  end
end