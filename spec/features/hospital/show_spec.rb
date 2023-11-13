require "rails_helper"

RSpec.describe "hospital show page" do
  before :each do
    @hospital = Hospital.create(name: "St. Turing's")
    @doctor1 = @hospital.doctors.create(name: "Dr. Spaceman", specialty: "Psychology", university: "Columbia")
    @doctor2 = @hospital.doctors.create(name: "Dr. Sameplot", specialty: "torsos", university: "DeVry")
    @patient1 = @doctor1.patients.create(name: "Tracy Jordan", age: 40)
    @patient2 = @doctor1.patients.create(name: "Jenna Maroney", age: 39)
    @patient3 = @doctor1.patients.create(name: "Jack Donnaghey", age: 43)
    @patient4 = @doctor2.patients.create(name: "Bart Simpson", age: 10)
    @doctor2.patients << @patient1
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
  it "lists all doctors belonging to the hospital, and the number of patients" do
    visit hospital_path(@hospital.id)

    expect(page).to have_content(@hospital.name)
    expect(@doctor1.name).to appear_before(@doctor2.name)
    within("#doctor-#{@doctor1.id}") do
      expect(page).to have_content("3 patients")
    end
    within("#doctor-#{@doctor2.id}") do
      expect(page).to have_content("2 patients")
    end
  end
end