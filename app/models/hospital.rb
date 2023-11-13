class Hospital < ApplicationRecord
  has_many :doctors

  def sort_by_doctor_patient_count
    doctors
          .joins(:doctor_patients)
          .group("doctors.id")
          .select("doctors.*, COUNT(doctor_patients.id) AS patient_count")
          .order("patient_count DESC")
  end
end