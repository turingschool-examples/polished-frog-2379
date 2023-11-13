require "rails_helper"

RSpec.describe Patient, type: :feature do
  describe "As a visitor" do
    before :each do
      @hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")

      @doctor_1 = @hospital.doctors.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University")
      @doctor_2 = @hospital.doctors.create!(name: "Alex Karev", specialty: "Pediatric Surgery", university: "Johns Hopkins University")

      @patient_1 = Patient.create!(name: "Katie Bryce", age: 24)
      @patient_2 = Patient.create!(name: "Denny Duquette", age: 39)
      @patient_3 = Patient.create!(name: "Rebecca Pope", age: 32)
      @patient_4 = Patient.create!(name: "Zola Shepherd", age: 2)


      DoctorPatient.create!(doctor_id: @doctor_1.id, patient_id: @patient_1.id)
      DoctorPatient.create!(doctor_id: @doctor_1.id, patient_id: @patient_2.id)
      DoctorPatient.create!(doctor_id: @doctor_2.id, patient_id: @patient_3.id)
      DoctorPatient.create!(doctor_id: @doctor_2.id, patient_id: @patient_4.id)
    end

    it "I see the names of all adult patients (older than 18) and a list of names are ascending order of number of doctors they see" do
      visit patients_path
      expect(@patient_1.name).to appear_before(@patient_3.name)
      expect(@patient_2.name).to appear_before(@patient_1.name)
      expect(page).to_not have_content(@patient_4.name)
    end
  end
end
