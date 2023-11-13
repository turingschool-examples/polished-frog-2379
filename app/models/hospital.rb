class Hospital < ApplicationRecord
  has_many :doctors
  has_many :patients, through: :doctors

  def ordered_doctors
    doctors
      .select("doctors.*, COUNT(patients.id) as patient_count")
      .joins(:patients)
      .group("doctors.id")
      .order("patient_count DESC")
  end
end
