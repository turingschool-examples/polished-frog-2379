require "rails_helper"

RSpec.describe Hospital, type: :feature do
  describe "As a visitor" do
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

    it "I see the hospital's name, the number of doctors that work at the hospital, and a unique list of universities that the hospital's doctors attended" do
      visit hospital_path(@hospital)
      expect(page).to have_content(@hospital.name)
      expect(page).to have_content(@doctor_2.name)
      expect(page).to have_content(@doctor_1.name)
      expect(page).to have_content("Number of Doctors: 2")
      expect(@doctor_2.name).to appear_before(@doctor_1.name)
    end
  end
end