require "rails_helper"

RSpec.describe "doctors#show" do
  before(:each) do
    @hospital1 = Hospital.create!(name: "Muppet MD")
   
    @doctor1 = @hospital1.doctors.create!(name: "Kermit", specialty: "legs and tounge", university: "Frog U Mississippi" )
    @doctor2 = @hospital1.doctors.create!(name: "Fozzie", specialty: "fur and humor(s)", university: "Bear Comedy College" )
    
    @patient1 = Patient.create!(name: "Rolff", age: 40 )
    @patient2 = Patient.create!(name: "Rizzo", age: 45 )
    @patient3 = Patient.create!(name: "Gonzo", age: 50 )
    @patient4 = Patient.create!(name: "Scooter", age: 35 )
    
    @patient5 = Patient.create!(name: "Robin the Frog", age: 16 )

    @doc_pat1 = DoctorPatient.create!(doctor: @doctor1, patient: @patient1)
    @doc_pat2 = DoctorPatient.create!(doctor: @doctor1, patient: @patient2)
    @doc_pat3 = DoctorPatient.create!(doctor: @doctor1, patient: @patient3)

    @doc_pat7 = DoctorPatient.create!(doctor: @doctor1, patient: @patient5)

    @doc_pat4 = DoctorPatient.create!(doctor: @doctor2, patient: @patient2)
    @doc_pat5 = DoctorPatient.create!(doctor: @doctor2, patient: @patient3)
    @doc_pat6 = DoctorPatient.create!(doctor: @doctor2, patient: @patient4)

  end

  
  # Extension, Hospital Show Page
  # ​
  # As a visitor
  # When I visit a hospital's show page
  # I see the hospital's name
  # And I see the names of all doctors that work at this hospital,
  # And next to each doctor I see the number of patients associated with the doctor,
  # And I see the list of doctors is ordered from most number of patients to least number of patients
  # (Doctor patient counts should be a single query)
  describe "when I visit '/hospitals/:id'" do
    describe "Extension" do
      it "shows the names of all the doctors that work at this hospital and next to each doctor I see the number of patients
      associated with the doctor and the list of doctors is ordered from the most patietns to the least" do
        visit "/hospitals/#{@hospital1.id}"

        expect(page).to have_content("#{@hospital1.name}'s Show Page")

        within("#doctor-#{@doctor1.id}_info") do
          expect(page).to have_content("Doctor: #{@doctor1.name}")
          expect(page).to have_content("Number of Patients: 4")
        end

        within("#doctor-#{@doctor2.id}_info") do
          expect(page).to have_content("Doctor: #{@doctor2.name}")
          expect(page).to have_content("Number of Patients: 3")
        end

        expect(@doctor1.name).to appear_before(@doctor2.name)

      end
    end
  end
end



