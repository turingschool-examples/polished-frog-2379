require 'rails_helper' 

RSpec.describe Doctor, type: :feature do 
  before(:each) do 
    @hospital1 = Hospital.create!(name: "Grey Sloan Memorial Hospital")
    @hospital2 = Hospital.create!(name: "Seaside Health & Wellness Center")

    @doctor1 = @hospital1.doctors.create!(name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University")
    @doctor2 = @hospital1.doctors.create!(name: "Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University")  
    @doctor3 = @hospital1.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", education: "Stanford University")
    @doctor4 = @hospital2.doctors.create!(name: "Derek McDreamy Shephard", specialty: "Attending Surgeon", education: "University of Pennsylvania")

    @patient1 = @doctor1.patients.create!(name: "Katie Bryce", age: 24)
    @patient2 = @doctor2.patientsPatient.create!(name: "Denny Duquette", age: 39)
    @patient3 = @doctor3.patientsPatient.create!(name: "Rebecca Pope", age: 32)
    @patient4 = @doctor4.patientsPatient.create!(name: "Zola Shephard", age: 2)
    
    describe "When I visit a doctor's show page" do
      it 'displays all of the doctors information, the hospital where they work and all of their patients' do
        visit "/doctors/#{@doctor1}"

        expect(page).to have_content("Meredith Grey")
        expect(page).to have_content("General Surgery")
        expect(page).to have_content("Grey Sloan Memorial Hospital")
        expect(page).to have_content("Katie Bryce")

        visit "/doctors/#{@doctor2}"

        expect(page).to have_content("Alex Karev")
        expect(page).to have_content("Pediatric Surgery")
        expect(page).to have_content("Grey Sloan Memorial Hospital")
        expect(page).to have_content("Denny Duquette")

        visit "/doctors/#{@doctor3}"

        expect(page).to have_content("Miranda Bailey")
        expect(page).to have_content("General Surgery")
        expect(page).to have_content("Grey Sloan Memorial Hospital")
        expect(page).to have_content("Rebecca Pope")

        visit "/doctors/#{@doctor4}"

        expect(page).to have_content("Derek McDreamy Shephard")
        expect(page).to have_content("Attending Surgeon")
        expect(page).to have_content("Seaside Health & Wellness Center")
        expect(page).to have_content("Zola Shephard")
      end
    end
  end
end