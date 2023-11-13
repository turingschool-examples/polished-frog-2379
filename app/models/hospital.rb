class Hospital < ApplicationRecord
  has_many :doctors
  has_many :patient_doctors, through: :doctors
  has_many :patients, through: :patient_doctors

  def doctors_by_patient_load
    doctors.left_joins(:patients).select('doctors.*, count(patients.*) as patient_count').group('doctors.id').order("patient_count desc")
  end

end