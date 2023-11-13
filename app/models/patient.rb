class Patient < ApplicationRecord
  has_many :doctor_patients, dependent: :destroy
  has_many :doctors, through: :doctor_patients, dependent: :destroy
  
  def self.adults
    where('age > ?', 18).order(:name)
  end
end