class Hospital < ApplicationRecord
  validates_presence_of :name

  has_many :doctors
  has_many :doctor_patients, through: :doctors
  has_many :patients, through: :doctor_patients

  def doctor_pat_sort 
    doctors.joins(:doctor_patients)
           .select("doctors.*, COUNT(doctor_patients.id) AS pat_count")
           .group(:id)
           .order("pat_count DESC")
  end
end