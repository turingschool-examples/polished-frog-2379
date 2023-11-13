class Patient < ApplicationRecord
  has_many :patient_doctors
  has_many :doctors, through: :patient_doctors

  validates :name, presence: true
  validates :age, presence: true

  def self.adults_alpha_names
    where('age > ?', 18).order(name: :asc).pluck(:name).uniq
  end
end
