require 'rails_helper'

RSpec.describe Hospital do
  describe "relationships" do
  it {should have_many :doctors}
  end

  describe "instance methods" do
    before :each do
      @hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
      @hospital_2 = Hospital.create!(name: "Seaside Health & Wellness Center")

      @doctor_1 = @hospital.doctors.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University")
      @doctor_2 = @hospital.doctors.create!(name: "Alex Karev", specialty: "Pediatric Surgery", university: "Johns Hopkins University")
      @doctor_3 = @hospital_2.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
      @doctor_4 = @hospital_2.doctors.create!(name: "Derek McDreamy Shepherd", specialty: "Attending Surgeon", university: "University of Pennsylvania")

      @patient_1 = Patient.create!(name: "Katie Bryce", age: 24)
      @patient_2 = Patient.create!(name: "Denny Duquette", age: 39)
      @patient_3 = Patient.create!(name: "Rebecca Pope", age: 32)
      @patient_4 = Patient.create!(name: "Zola Shepherd", age: 2)


      DoctorPatient.create!(doctor_id: @doctor_1.id, patient_id: @patient_1.id)
      DoctorPatient.create!(doctor_id: @doctor_1.id, patient_id: @patient_2.id)
      DoctorPatient.create!(doctor_id: @doctor_2.id, patient_id: @patient_3.id)
      DoctorPatient.create!(doctor_id: @doctor_2.id, patient_id: @patient_1.id)
      DoctorPatient.create!(doctor_id: @doctor_2.id, patient_id: @patient_4.id)
    end
    it "#doctor_count" do
    expect(@hospital.doctor_count).to eq(2)
    end

    it "#doctor_by_patient_count" do
      expect(@hospital.doctor_by_patients_count).to eq("Alex Karev, Meredith Grey")
    end
  end
end
