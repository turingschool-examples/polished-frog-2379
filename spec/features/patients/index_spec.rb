require "rails_helper"

RSpec.describe "Patient" do
  before :each do
    test_data 
  end

  describe "patient index page" do
    it "US3: displays names of all adult patients in ascending alphabetical order" do
      # User Story 3, Patient Index Page
      # As a visitor
      # When I visit the patient index page
      # I see the names of all adult patients (age is greater than 18),
      # And I see the names are in ascending alphabetical order (A - Z, you do not need to account for capitalization)
      visit "/patients"
      expect(page).to have_content(@patient1.name)
      expect(page).to have_content(@patient2.name)
      expect(page).to have_content(@patient3.name)
      expect(@patient2.name).to appear_before(@patient1.name)
      expect(@patient2.name).to appear_before(@patient3.name)
      expect(@patient1.name).to appear_before(@patient3.name)
    end
  end
end