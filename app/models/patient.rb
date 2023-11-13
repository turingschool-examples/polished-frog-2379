class Patient < ApplicationRecord
  has_many :doctor_patients
  has_many :doctors, through: :doctor_patients

  validates :name, presence: true 
  validates :age, presence: true, numericality: true  

  def self.alphabetical_adult
    all
    .order('name ASC')
    .where('age >= 18') 
  end
end