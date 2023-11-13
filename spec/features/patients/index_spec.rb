require "rails_helper"

RSpec.describe Patient, type: :feature do
  before :each do
    @hospital1 = Hospital.create!(name: "UC")
    @hospital2 = Hospital.create!(name: "UTMB")
    @doctor1 = @hospital1.doctors.create!(name: "Doctor 1", specialty: "Rheum", university: "LSU")
    @doctor2 = @hospital2.doctors.create!(name: "Doctor 2", specialty: "Gastro", university: "MSU")
    @doctor3 = @hospital2.doctors.create!(name: "Doctor 3", specialty: "Card", university: "KSU")
    @doctor4 = @hospital1.doctors.create!(name: "Doctor 4", specialty: "Card", university: "NSU")
    @patient1 = @doctor1.patients.create!(name: "bPatient 1", age: 10)
    @patient2 = @doctor1.patients.create!(name: "cPatient 2", age: 20)
    @patient3 = @doctor2.patients.create!(name: "kPatient 3", age: 50)
    @patient4 = @doctor1.patients.create!(name: "rPatient 4", age: 40)
    @patient5 = @doctor2.patients.create!(name: "mPatient 5", age: 18)
    @patient6 = @doctor3.patients.create!(name: "aPatient 6", age: 70)
    @doctor4.patients << @patient1
    @doctor4.patients << @patient2
  end

  describe "As a visitor when I visit the patient index page" do
    it "I see the names of all adult patients (age is greater than 18)" do
      visit "/patients"
      expect(page).to have_content("cPatient 2")
      expect(page).to have_content("kPatient 3")
      expect(page).to have_content("rPatient 4")
      expect(page).to have_content("aPatient 6")
      expect(page).to_not have_content("bPatient 1")
      expect(page).to_not have_content("mPatient 5")

    end

    it "And I see the names are in ascending alphabetical order (A - Z, you do not need to account for capitalization)" do
      visit "/patients"
      expect("aPatient 6").to appear_before("cPatient 2")
      expect("cPatient 2").to appear_before("kPatient 3")
      expect("kPatient 3").to appear_before("rPatient 4")
    end
  end
end