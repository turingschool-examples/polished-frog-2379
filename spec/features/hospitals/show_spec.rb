require "rails_helper"

RSpec.describe "Hospital" do
  before :each do
    test_data 
  end

  describe "hospital show page" do
    it "EX: shows hospital name, all the doctors that work here, and next to each doctor a count of their patients" do
    # Extension, Hospital Show Page
    # As a visitor
    # When I visit a hospital's show page
    # I see the hospital's name
    # And I see the names of all doctors that work at this hospital,
    # And next to each doctor I see the number of patients associated with the doctor,
    # And I see the list of doctors is ordered from most number of patients to least number of patients
    # (Doctor patient counts should be a single query)
      visit "/hospitals/#{@hospital1.id}"
      within("#hospital-details") do
        expect(page).to have_content(@hospital1.name)
      end
      within("#doctors-list") do
        expect(page).to have_content(@doctor1.name)
        expect(page).to have_content(@doctor2.name)
        expect(@doctor1.name).to appear_before(@doctor2.name)
        expect("Patient Count: 3").to appear_before("Patient Count: 1")
      end
    end
  end
end