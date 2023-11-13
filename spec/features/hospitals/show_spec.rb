require "rails_helper"

RSpec.describe Patient, type: :feature do
  before :each do
    @hospital1 = Hospital.create!(name: "UC")
    @hospital2 = Hospital.create!(name: "UTMB")
    @doctor1 = @hospital1.doctors.create!(name: "Doctor 1", specialty: "Rheum", university: "LSU")
    @doctor2 = @hospital2.doctors.create!(name: "Doctor 2", specialty: "Gastro", university: "MSU")
    @doctor3 = @hospital2.doctors.create!(name: "Doctor 3", specialty: "Card", university: "KSU")
    @doctor4 = @hospital1.doctors.create!(name: "Doctor 4", specialty: "Card", university: "NSU")
    @doctor5 = @hospital2.doctors.create!(name: "Doctor 5", specialty: "Ortho", university: "OSU")
    @patient1 = @doctor1.patients.create!(name: "bPatient 1", age: 10)
    @patient2 = @doctor1.patients.create!(name: "cPatient 2", age: 20)
    @patient3 = @doctor3.patients.create!(name: "kPatient 3", age: 50)
    @patient4 = @doctor1.patients.create!(name: "rPatient 4", age: 40)
    @patient5 = @doctor2.patients.create!(name: "mPatient 5", age: 18)
    @patient6 = @doctor3.patients.create!(name: "aPatient 6", age: 70)
    @doctor4.patients << @patient1
    @doctor4.patients << @patient2
    @doctor3.patients << @patient2
  end

  describe " As a visitor, when I visit a hospital's show page" do
    it "I see the hospital's name, and I see all of the doctor's that work at this hospital" do
      visit "/hospitals/#{@hospital1.id}"
      expect(page).to have_content("Hospital Name: UC")
      expect(page).to have_content("Doctor 1")
      expect(page).to have_content("Doctor 4")
      expect(page).to_not have_content("Doctor 2")
      expect(page).to_not have_content("Doctor 3")
      expect(page).to_not have_content("Doctor 5")
      
      visit "/hospitals/#{@hospital2.id}"
      expect(page).to have_content("Hospital Name: UTMB")
      expect(page).to_not have_content("Doctor 1")
      expect(page).to_not have_content("Doctor 4")
      expect(page).to have_content("Doctor 2")
      expect(page).to have_content("Doctor 3")
      expect(page).to have_content("Doctor 5")
    end

    it "And next to each doctor, I see the number of patients associatied with the doctor (doctor's in order of patients)" do
      visit "/hospitals/#{@hospital1.id}"
      expect("Doctor 1, Patients: 3").to appear_before("Doctor 4, Patients: 2")

      visit "/hospitals/#{@hospital2.id}"
      expect("Doctor 3, Patients: 3").to appear_before("Doctor 2, Patients: 1")
      expect("Doctor 2, Patients: 1").to appear_before("Doctor 5, Patients: 0")
    end
  end
end