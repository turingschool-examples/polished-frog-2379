class Patient < ApplicationRecord 
  has_many :patient_doctors
  has_many :doctors, through: :patient_doctors
  
  validates :name, :age, presence: true

  def adult? 
    self.age >= 18
  end

  def self.sort 
    where("age >= 18").order("name asc").pluck(:name)
  end
end