class Doctor < ApplicationRecord
  belongs_to :hospital
  has_many :doctor_patients
  has_many :patients, through: :doctor_patients

  def self.patient_count(hospital_id)
    Doctor.joins(:patients, :hospital).where(hospital: {id: "#{hospital_id}"}).select("doctors.name, doctors.id, COUNT(patients.id) AS patient_count").group("doctors.id").order("patient_count DESC")
  end
end