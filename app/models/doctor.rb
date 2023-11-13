class Doctor < ApplicationRecord
  belongs_to :hospital
  has_many :doctor_patients
  has_many :patients, through: :doctor_patients

  def hospital_name
    hospital.name
  end

  def patients_count
    patients.count
  end

  def self.patients_count_desc
    Doctor.all.sort_by(&:patients_count).reverse
  end
end