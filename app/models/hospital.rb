class Hospital < ApplicationRecord
  has_many :doctors

  def doctor_count
    doctors.count
  end

  def doctor_by_patients_count
    doctors.joins(:patients).group(:id).order('COUNT(patients.id) DESC').map(&:name)
  end
end