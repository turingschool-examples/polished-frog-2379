class Doctor < ApplicationRecord
  belongs_to :hospital
  has_many :patient_doctors 
  has_many :patients, through: :patient_doctors

  validates :name, :specialty, :education, presence: true

  def patient_count
    patients.count
  end
  
end