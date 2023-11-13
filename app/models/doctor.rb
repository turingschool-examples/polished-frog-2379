class Doctor < ApplicationRecord
  belongs_to :hospital
  has_many :patient_doctors
  has_many :patients, through: :patient_doctors

  validates :name, presence: true
  validates :specialty, presence: true
  validates :university, presence: true
  validates :hospital_id, presence: true
end
