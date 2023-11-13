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

  # User Story 1, Doctors Show Page
  # ​
  # As a visitor
  # When I visit a doctor's show page
  # I see all of that doctor's information including:
  #  - name
  #  - specialty
  #  - university where they got their doctorate
  # And I see the name of the hospital where this doctor works
  # And I see the names of all of the patients this doctor has
  describe "when I visit '/doctors/:id'" do
    describe "US1." do
      it "shows that doctor's info indluding: name, specialty, university" do
        visit "/doctors/#{@doctor1.id}"

        expect(page).to have_content("Doctor: #{@doctor1.name}")
        expect(page).to have_content("Specialty: #{@doctor1.specialty}")
        expect(page).to have_content("Graduate of: #{@doctor1.university}")
      end

      it "shows the name of the hospital where this doctor works and the names of all the patients this doctor has" do
        visit "/doctors/#{@doctor1.id}"

        expect(page).to have_content("Doctor at: #{@hospital1.name}")

        within("#patient-#{@patient1.id}") do
          expect(page).to have_content(@patient1.name)
        end
        within("#patient-#{@patient2.id}") do
          expect(page).to have_content(@patient2.name)
        end
        within("#patient-#{@patient3.id}") do
          expect(page).to have_content(@patient3.name)
        end
      end
    end

    #     User Story 2, Remove a Patient from a Doctor
    # ​
    # As a visitor
    # When I visit a Doctor's show page
    # Then next to each patient's name, I see a button to remove that patient from that doctor's caseload
    # When I click that button for one patient
    # I'm brought back to the Doctor's show page
    # And I no longer see that patient's name listed
    # And when I visit a different doctor's show page that is caring for the same patient,
    # Then I see that the patient is still on the other doctor's caseload
    describe "US2." do
      it "next to each patient's name I see a button to remove that patient from that doctor's caseload
    when clicked, I'm brought back to the Doctor's show page and no longer see that patient's name listed
      and when I visit another doctor's show page that is caring for the same patient, I see that patient is still on
      the other doctor's caseload" do
        visit "/doctors/#{@doctor1.id}"

        within("#patient-#{@patient2.id}") do
          expect(page).to have_button("Remove #{@patient2.name}")
          click_button("Remove #{@patient2.name}")
        end

        expect(current_path).to eq("/doctors/#{@doctor1.id}")

        expect(page).to_not have_content(@patient2.name)

        visit "/doctors/#{@doctor2.id}"

        within("#patient-#{@patient2.id}") do
          expect(page).to have_content(@patient2.name)
        end        
      end
    end
  end
end







