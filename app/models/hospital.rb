class Hospital < ApplicationRecord
  has_many :doctors

  def doctor_list
    Doctor.where(hospital_id: self.id)
          .select('doctors.id AS doctor_id, doctors.name, COUNT(patients.id) AS patient_count')
          .joins(:patients)
          .group('doctors.id')
  end
end
