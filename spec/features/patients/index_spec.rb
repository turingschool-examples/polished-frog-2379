require "rails_helper"

RSpec.describe "Patient Show Page", type: :feature do
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

  #US3
  describe "As a Visitor" do
    describe "When I visit the patient index page" do
      describe "I see the names of all adult patients (age is greater than 18)" do
        it "I see the names are in ascending alphabetical order (A - Z, you do not need to account for capitalization)" do
          
          visit "/patients"

          expect(@patient2.name).to appear_before(@patient1.name)
          expect(@patient1.name).to appear_before(@patient3.name)
          expect(page).to_not have_content(@patient4.name)
          
        end
      end
    end
  end
end 