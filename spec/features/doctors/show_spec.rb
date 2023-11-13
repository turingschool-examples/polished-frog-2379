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

    @doc_pat1 = DoctorPatient.create!(doctor: @doctor1, patient: @patient1)
    @doc_pat2 = DoctorPatient.create!(doctor: @doctor1, patient: @patient2)
    @doc_pat3 = DoctorPatient.create!(doctor: @doctor1, patient: @patient3)

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
  end
end







