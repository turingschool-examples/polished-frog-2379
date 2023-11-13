require "rails_helper"

RSpec.describe "patients#index" do
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

  #   User Story 3, Patient Index Page
  # ​
  # As a visitor
  # When I visit the patient index page
  # I see the names of all adult patients (age is greater than 18),
  # And I see the names are in ascending alphabetical order (A - Z, you do not need to account for capitalization)

  describe "when I visit '/patients'" do
    describe "US3." do
      it "shows the names of all adult patients and I also see the names are in ascending alphabetical order" do
        visit "/patients"

        expect(page).to have_content(@patient1.name)
        expect(page).to have_content(@patient2.name)
        expect(page).to have_content(@patient3.name)
        expect(page).to have_content(@patient4.name)

        expect(page).to_not have_content(@patient5.name)

        expect(@patient3.name).to appear_before(@patient2.name)
        expect(@patient2.name).to appear_before(@patient1.name)
        expect(@patient1.name).to appear_before(@patient4.name)
      end
    end
  end
end