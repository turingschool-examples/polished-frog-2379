class Patient < ApplicationRecord
  has_many :doctor_patients
  has_many :doctors, through: :doctor_patients

  def over_eighteen
    if self.age >= 18
      return true
    end
  end

  def self.alphabetize_by_name
    order(:name)
    # names = self.name.split(" ")
    # if names.length == 2
    #   last_name_first = "#{names[1]}, #{names[0]}"
    #   puts last_name_first
    # else
    #   puts "Invalid Name Format: Names Must Consist of a First and Last Name Only"
    # end
  end
end