require 'rails_helper' 

RSpec.describe Patient, type: :feature do 
  before(:each) do 
    @hospital1 = Hospital.create!(name: "Grey Sloan Memorial Hospital")
    @hospital2 = Hospital.create!(name: "Seaside Health & Wellness Center")

    @doctor1 = @hospital1.doctors.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University")
    @doctor2 = @hospital1.doctors.create!(name: "Alex Karev", specialty: "Pediatric Surgery", university: "Johns Hopkins University")  
    @doctor3 = @hospital1.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
    @doctor4 = @hospital2.doctors.create!(name: "Derek McDreamy Shephard", specialty: "Attending Surgeon", university: "University of Pennsylvania")

    @patient1 = Patient.create!(name: "Katie Bryce", age: 24)
    @patient2 = Patient.create!(name: "Denny Duquette", age: 39)
    @patient3 = Patient.create!(name: "Rebecca Pope", age: 32)
    @patient4 = Patient.create!(name: "Zola Shephard", age: 2)

    @doctorpatient1 = DoctorPatient.create!(doctor_id: @doctor1.id, patient_id: @patient1.id)
    @doctorpatient11 = DoctorPatient.create!(doctor_id: @doctor2.id, patient_id: @patient1.id)
    @doctorpatient2 = DoctorPatient.create!(doctor_id: @doctor2.id, patient_id: @patient2.id)
    @doctorpatient22 = DoctorPatient.create!(doctor_id: @doctor3.id, patient_id: @patient2.id)
    @doctorpatient3 = DoctorPatient.create!(doctor_id: @doctor3.id, patient_id: @patient3.id)
    @doctorpatient4 = DoctorPatient.create!(doctor_id: @doctor4.id, patient_id: @patient4.id)
  end
    
  describe "When I visit a patients index page" do
    it 'I see the names of all adult patients (age is greater than 18),
      And I see the names are in ascending alphabetical order (A - Z, you do not need to account for capitalization)' do
      visit "/doctors/#{@doctor1.id}/patients"

      expect(page).to have_content("Katie Bryce")
      expect(page).to have_content("Denny Duquette")
      expect(page).to have_content("Rebecca Pope")
      expect(page).not_to have_content("Zola Shephard")

      expect(@patient1.name).to appear_before(@patient3.name)
      expect(@patient2.name).to appear_before(@patient1.name)
    end
  end
end