require "rails_helper"

RSpec.describe "Doctor" do
  before :each do
    test_data 
  end

  describe "doctor show page" do
    it "US1: shows doctor name, speciality, university, hospital, and patients" do
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
  end
end