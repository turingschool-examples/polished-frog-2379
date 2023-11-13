require "rails_helper"

RSpec.describe Doctor, type: :feature do
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
      DoctorPatient.create!(doctor_id: @doctor_2.id, patient_id: @patient_1.id)
    end
    
    it "I see all of that doctor's information" do
      visit doctor_path(@doctor_1)
      expect(page).to have_content(@doctor_1.name)
      expect(page).to have_content(@doctor_1.specialty)
      expect(page).to have_content(@doctor_1.university)
      expect(page).to have_content(@hospital.name)
      expect(page).to have_content(@patient_1.name)
      expect(page).to have_content(@patient_2.name)
      expect(page).to_not have_content(@doctor_2.name)
    end

    it "I see a button to remove a patient from that doctor's caseload" do
      visit doctor_path(@doctor_1)
      expect(page).to have_button("Remove Patient")
      click_button("Remove Patient")
      expect(current_path).to eq(doctor_path(@doctor_1))
      expect(page).to_not have_content(@patient_1.name)

      visit doctor_path(@doctor_2)
      expect(page).to have_content(@patient_1.name)
    end
  end
end