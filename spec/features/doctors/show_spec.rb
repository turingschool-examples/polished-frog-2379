require 'rails_helper'

RSpec.describe 'the doctor show page' do
  before :each do
    @grace = Hospital.create!(name: "Grace Memorial")
    @doctor_1 = @grace.doctors.create!(name: "Lawrence", specialty: "Orthopedics", university: "Anchultz")
    @doctor_2 = @grace.doctors.create!(name: "Charlie", specialty: "Cardiology", university: "Seattle University")
    @patient_1 = @doctor_1.patients.create!(name: "Steve Harvey", age: 61)
    @patient_2 = @doctor_1.patients.create!(name: "Joe Schmoe", age: 2)
    @patient_3 = @doctor_1.patients.create!(name: "Lorelei Gilmore", age: 17)
    @patient_4 = @doctor_2.patients.create!(name: "Santa Claus", age: 82)
  end

  describe "User Story 1" do
    it "should have the doctor's attributes" do
      visit doctor_path(@doctor_1)

      expect(page).to have_content(@doctor_1.name)
      expect(page).to have_content(@doctor_1.specialty)
      expect(page).to have_content(@doctor_1.university)
    end

    it "should have the hospital where the doctor works" do
      visit doctor_path(@doctor_1)

      expect(page).to have_content("Hospital: Grace Memorial")
    end

    it "should have the doctor's patients" do
      visit doctor_path(@doctor_1)

      expect(page).to have_content("Steve Harvey")
      expect(page).to have_content("Joe Schmoe")
      expect(page).to have_content("Lorelei Gilmore")
      expect(page).to_not have_content("Santa Claus")
    end
  end
end