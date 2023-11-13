require 'rails_helper'

RSpec.describe 'the patients index page' do
  before :each do
    @grace = Hospital.create!(name: "Grace Memorial")
    @doctor_1 = @grace.doctors.create!(name: "Lawrence", specialty: "Orthopedics", university: "Anchultz")
    @doctor_2 = @grace.doctors.create!(name: "Charlie", specialty: "Cardiology", university: "Seattle University")
    @patient_1 = @doctor_1.patients.create!(name: "Steve Harvey", age: 61)
    @patient_2 = @doctor_1.patients.create!(name: "Joe Schmoe", age: 2)
    @patient_3 = @doctor_1.patients.create!(name: "Lorelei Gilmore", age: 17)
    @patient_4 = @doctor_2.patients.create!(name: "Santa Claus", age: 82)
    @patient_5 = @doctor_2.patients.create!(name: "Misses Claus", age: 84)
  end

  describe "User Story 3" do
    it "has only adult patients" do
      visit patients_path

      expect(page).to have_content("Adult Patients")
      expect(page).to have_content("Steve Harvey")
      expect(page).to_not have_content("Joe Schmoe")
      expect(page).to_not have_content("Lorelei Gilmore")
      expect(page).to have_content("Santa Claus")
      expect(page).to have_content("Misses Claus")
    end

    it "has patients in alphabetical order" do
      visit patients_path

      expect(@patient_4).to appear_before(@patient_1)
      expect(@patient_1).to appear_before(@patient_5)
    end
  end
end