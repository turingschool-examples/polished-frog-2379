class Doctor < ApplicationRecord
  belongs_to :hospital
  has_many :doctor_patients
  has_many :patients, through: :doctor_patients

  def self.order_doctors_by_patients
    find_by_sql("select doctors.*, count(patient_id) as num_patients from doctors inner join doctor_patients on doctor_patients.doctor_id = doctors.id inner join patients on doctor_patients.patient_id = patients.id group by doctors.id order by count(patient_id) desc")
  end
  
  def patients_count
    patients.count
  end
end