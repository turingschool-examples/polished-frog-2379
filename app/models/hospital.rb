class Hospital < ApplicationRecord
  has_many :doctors

  validates :name, presence: true

  def sort_by_patient_count 
    result = self.doctors
        .joins(:patients)
        .group("doctors.id")
        .select("doctors.*, count(patients.id)")
        .order("count(patients.id) DESC")
  end
end