class Hospital < ApplicationRecord
  has_many :doctors

  def doctors_with_patient_count
    doctors.joins(:doctor_patients).select("doctors.*, count(doctor_patients.doctor_id) as patient_count").group("doctors.id").order("patient_count DESC")
  end
end