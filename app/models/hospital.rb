class Hospital < ApplicationRecord
  has_many :doctors

  def docs_ordered_by_patients
    doctors.sort_by { |doc| -doc.patients.count }
  end
end
