require 'rails_helper'

RSpec.describe Patient do
  it {should have_many(:patient_doctors)}
  it {should have_many(:doctors).through(:patient_doctors)}

  before :each do
    @hospital1 = Hospital.create!(name: "Grey Sloan Memorial Hospital")
    @hospital2 = Hospital.create!(name: "Seaside Health & Wellness Center")

    @doctor1 = Doctor.create!(hospital_id: @hospital1.id, name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University")
    @doctor2 = Doctor.create!(hospital_id: @hospital2.id, name: "Alex Karev", specialty: "Pediatric Surgery", university: "Johns Hopkins University")

    @patient1 = Patient.create!(name: "Katie Bryce", age: 24)
    @patient2 = Patient.create!(name: "Denny Duquette", age: 39)
    @patient3 = Patient.create!(name: "Rebecca Pope", age: 32)
    @patient4 = Patient.create!(name: "Zola Shepherd", age: 2)

    PatientDoctor.create!(patient_id: @patient1.id, doctor_id: @doctor1.id)
    PatientDoctor.create!(patient_id: @patient1.id, doctor_id: @doctor2.id)
    PatientDoctor.create!(patient_id: @patient2.id, doctor_id: @doctor1.id)
    PatientDoctor.create!(patient_id: @patient3.id, doctor_id: @doctor2.id)
  end

  describe "#adult_patients" do
    it "displays all the patients over 18" do
      adult_patients = Patient.adult_patients
    
      expect(adult_patients).to eq([@patient1, @patient2, @patient3])
    end
  end

  describe "#order_by_name" do
    it "displayes the patients in alphabetical order" do
      patients = Patient.order_by_name
    
      expect(patients).to eq([@patient2, @patient1, @patient3, @patient4])
    end
  end
end