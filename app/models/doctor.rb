class Doctor < ApplicationRecord
  belongs_to :hospital
  has_many :patient_doctors
  has_many :patients, through: :patient_doctors

  def patient_count_formatted
    "#{name}, Patients: #{patients.count}"
  end
end