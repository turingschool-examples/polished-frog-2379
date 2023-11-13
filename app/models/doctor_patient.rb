class DoctorPatient < ApplicationRecord
  belongs_to :doctor, dependent: :destroy
  belongs_to :patient, dependent: :destroy
end