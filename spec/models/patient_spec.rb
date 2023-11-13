require 'rails_helper'

RSpec.describe Patient do
  describe "relationships" do
    it {should have_many :doctor_patients}
    it {should have_many(:doctors).through(:doctor_patients)}
  end

  before :each do
    @hospital_1 = Hospital.create!(name: "Grey Sloan Memorial Hospital")
    @hospital_2 = Hospital.create!(name: "Seaside Health & Wellness Center")
    @doctor_1 = @hospital_1.doctors.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University")
    @doctor_2 = @hospital_1.doctors.create!(name: "Alex Karev", specialty: "Pediatric Surgery", university: "Johns Hopkins University")
    @patient_1 = @doctor_1.patients.create!(name: "Katie Bryce", age: 24)
    @patient_2 = @doctor_1.patients.create!(name: "Denny Duquette", age: 39)
    @patient_3 = Patient.create!(name: "Rebecca Pope", age: 32)
    @patient_4 = Patient.create!(name: "Zola Shepherd", age: 2)
    @doctor_2.patients << @patient_1
  end

  describe "class methods" do
    describe ".over_18" do
      it "returns all patients over the age of 18" do
        expect(Patient.over_18.sort).to eq([@patient_1, @patient_2, @patient_3].sort)
      end
    end
  end
end