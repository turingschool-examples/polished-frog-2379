class Hospital < ApplicationRecord
  has_many :doctors
  has_many :patients, through: :doctors

  def doctor_patient_counts
    self.doctors
    .joins(:patients)
    .group('doctors.id')
    .select('doctors.name, COUNT(patients.id) AS patient_count')
    .order('patient_count DESC')

  # SELECT doctors.name, COUNT(patients.id) AS patient_count
  # FROM doctors
  # INNER JOIN doctor_patients ON doctor_patients.doctor_id = doctors.id
  # INNER JOIN patients ON patients.id = doctor_patients.patient_id
  # WHERE doctors.hospital_id = 1
  # GROUP BY doctors.name
  # ORDER BY patient_count DESC;
  end
end