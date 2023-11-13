require "rails_helper"

RSpec.describe "Doctor" do
  before :each do
    test_data 
  end

  describe "doctor show page" do
    it "US1: shows doctor name, specialty, university, hospital, and patients" do
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
      visit "/hospitals/#{@hospital1.id}/doctors/#{@doctor1.id}"
      within("#doctor-details") do
        expect(page).to have_content("Name: #{@doctor1.name}")
        expect(page).to have_content("Specialty: #{@doctor1.specialty}")
        expect(page).to have_content("University: #{@doctor1.university}")
      end
      expect(page).to have_content("Hospital: #{@hospital1.name}")
      within("#patient-list") do
        expect(page).to have_content(@patient1.name)
        expect(page).to have_content(@patient2.name)
        expect(page).to have_content(@patient3.name)
        expect(page).to_not have_content(@patient4.name)
      end
    end
    it "US2: has button to remove patient association from doctor next to each patients name" do
      # User Story 2, Remove a Patient from a Doctor
      # As a visitor
      # When I visit a Doctor's show page
      # Then next to each patient's name, I see a button to remove that patient from that doctor's caseload
      # When I click that button for one patient
      # I'm brought back to the Doctor's show page
      # And I no longer see that patient's name listed
      # And when I visit a different doctor's show page that is caring for the same patient,
      # Then I see that the patient is still on the other doctor's caseload
      visit "/hospitals/#{@hospital1.id}/doctors/#{@doctor1.id}"
      within("#patient-list") do
        expect(page).to have_button("Remove #{@patient1.name} From Caseload")
        expect(page).to have_button("Remove #{@patient2.name} From Caseload")
        expect(page).to have_button("Remove #{@patient2.name} From Caseload")
      end
      click_button("Remove #{@patient1.name} From Caseload")
      expect(current_path).to eq("/hospitals/#{@hospital1.id}/doctors/#{@doctor1.id}")
      within("#patient-list") do
        expect(page).to_not have_content(@patient1.name)
      end
      visit "/hospitals/#{@hospital1.id}/doctors/#{@doctor3.id}"
      within("#patient-list") do
        expect(page).to have_content(@patient1.name)
      end
    end
  end
end