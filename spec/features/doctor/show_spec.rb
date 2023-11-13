require 'rails_helper' 

RSpec.describe Doctor, type: :feature do 
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
    @doctorpatient12 = DoctorPatient.create!(doctor_id: @doctor2.id, patient_id: @patient1.id)
    @doctorpatient2 = DoctorPatient.create!(doctor_id: @doctor2.id, patient_id: @patient2.id)
    @doctorpatient3 = DoctorPatient.create!(doctor_id: @doctor3.id, patient_id: @patient3.id)
    @doctorpatient4 = DoctorPatient.create!(doctor_id: @doctor4.id, patient_id: @patient4.id)
  end
    
  describe "When I visit a doctor's show page" do
    it 'displays all of the doctors information, the hospital where they work and all of their patients' do
      visit "/doctors/#{@doctor1.id}"

      expect(page).to have_content("Meredith Grey")
      expect(page).to have_content("General Surgery")
      expect(page).to have_content("Grey Sloan Memorial Hospital")
      expect(page).to have_content("Katie Bryce")

      visit "/doctors/#{@doctor2.id}"

      expect(page).to have_content("Alex Karev")
      expect(page).to have_content("Pediatric Surgery")
      expect(page).to have_content("Grey Sloan Memorial Hospital")
      expect(page).to have_content("Denny Duquette")
      expect(page).to have_content("Katie Bryce")

      visit "/doctors/#{@doctor3.id}"

      expect(page).to have_content("Miranda Bailey")
      expect(page).to have_content("General Surgery")
      expect(page).to have_content("Grey Sloan Memorial Hospital")
      expect(page).to have_content("Rebecca Pope")

      visit "/doctors/#{@doctor4.id}"

      expect(page).to have_content("Derek McDreamy Shephard")
      expect(page).to have_content("Attending Surgeon")
      expect(page).to have_content("Seaside Health & Wellness Center")
      expect(page).to have_content("Zola Shephard")
      
    end
  end

    
  describe "When I visit a doctor's show page" do
    xit 'I see a button to remove a patient from that doctors caseload
      When I click that button for one patient
      Im brought back to the Doctors show page
      And I no longer see that patients name listed
      And when I visit a different doctors show page that is caring for the same patient,
      Then I see that the patient is still on the other doctors caseload' do

      visit "/doctors/#{@doctor1.id}"

      expect(page).to have_content("Remove Patient")
      click_button "Remove Patient"
      expect(current_path).to eq("/doctors/#{@doctor1.id}")
      expect(page).to_not have_content("Katie Bryce")

    end
  end
end