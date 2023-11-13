class Doctor < ApplicationRecord
  belongs_to :hospital
  has_many :doctor_patients
  has_many :patients, through: :doctor_patients

  def patient_load
    self.patients.count
  end

  
  def self.busiest_to_least
    self.joins(:patients).group(:id).order('COUNT(patients.id) DESC')
  end
end