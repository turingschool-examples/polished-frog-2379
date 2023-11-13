class Patient < ApplicationRecord
  has_many :doctor_patients
  has_many :doctors, through: :doctor_patients
  
  # def adult
  #    self.age >= 18
  # end
  # too much ruby I think?

  def self.alphabetize
    self.all.order(name: :asc)
  end

  def self.no_minors
    self.all.where("age >= 18")
  end
end