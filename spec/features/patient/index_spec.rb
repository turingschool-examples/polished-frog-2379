require "rails_helper"

RSpec.describe "patient index" do
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
# As a visitor
# When I visit the patient index page
# I see the names of all adult patients (age is greater than 18),
# And I see the names are in ascending alphabetical order (A - Z, you do not need to account for capitalization)
  it "shows patients over age 18 in ascending alphabetical order" do
    visit patients_path

    expect(@patient3.name).to appear_before(@patient2.name)
    expect(@patient2.name).to appear_before(@patient1.name)
    expect(page).to_not have_content(@patient4.name)
  end
end