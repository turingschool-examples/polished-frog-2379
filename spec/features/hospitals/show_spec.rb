require "rails_helper"

RSpec.describe "Hospital Show Page", type: :feature do
  before :each do
    @hospital1 = Hospital.create!(name: "Grey Sloan Memorial Hospital")
    @hospital2 = Hospital.create!(name: "Seaside Health & Wellness Center")

    @doctor1 = Doctor.create!(hospital_id: @hospital1.id, name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University")
    @doctor2 = Doctor.create!(hospital_id: @hospital2.id, name: "Alex Karev", specialty: "Pediatric Surgery", university: "Johns Hopkins University")
    @doctor3 = Doctor.create!(hospital_id: @hospital1.id, name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
    @doctor4 = Doctor.create!(hospital_id: @hospital1.id, name: "Derek McDreamy Shepherd", specialty: "Attending Surgeon", university: "University of Pennsylvania")

    @patient1 = Patient.create!(name: "Katie Bryce", age: 24)
    @patient2 = Patient.create!(name: "Denny Duquette", age: 39)
    @patient3 = Patient.create!(name: "Rebecca Pope", age: 32)
    @patient4 = Patient.create!(name: "Zola Shepherd", age: 2)

    PatientDoctor.create!(patient_id: @patient1.id, doctor_id: @doctor1.id)
    PatientDoctor.create!(patient_id: @patient1.id, doctor_id: @doctor2.id)
    PatientDoctor.create!(patient_id: @patient2.id, doctor_id: @doctor1.id)
    PatientDoctor.create!(patient_id: @patient3.id, doctor_id: @doctor4.id)
  end

  #Extension
  describe "As a visitor" do
    describe "when I visit a hospitals show page" do
      describe "I see the hosptials name and I see the names of all doctors that work at this hospital" do
        describe "Next to each doctor I see the number of patients associated with the doctor" do
          it "I see the list of doctors is ordered from most patients to least patients" do
            
            visit "/hospitals/#{@hospital1.id}"

            expect(page).to have_content(@hospital1.name)
            expect(@doctor1.name).to appear_before(@doctor4.name)
            expect(@doctor1.patients.count).to appear_before(@doctor4.name)
            expect(@doctor4.name).to appear_before(@doctor3.name)
            expect(@doctor4.patients.count).to appear_before(@doctor3.name)
            expect(page).to have_content(@doctor3.patients.count)
          
            expect(page).to_not have_content(@doctor2.name)
          end
        end
      end
    end
  end
end 