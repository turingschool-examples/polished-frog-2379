require "rails_helper"

RSpec.describe "doctor show page" do
  before :each do
    @hospital = Hospital.create(name: "St. Turings")
    @doctor1 = @hospital.doctors.create(name: "Dr. Spaceman", specialty: "Psychology", university: "Columbia")
    @patient1 = @doctor1.patients.create(name: "Tracy Morgan", age: 40)
    @patient2 = @doctor1.patients.create(name: "Jenna Maroney", age: 39)
    @patient3 = @doctor1.patients.create(name: "Jack Donnaghey", age: 43)
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
  it "shows a single doctor's details" do
    visit doctor_path(@doctor1.id)

    expect(page).to have_content("Hi, my name is Dr. #{@doctor1.name}. I work at #{@doctor1.hospital.name}, specializing in #{@doctor1.specialty} and I studied at #{@doctor1.university}.")

    within("#dr-patients") do
      expect(page).to have_content(@patient1.name)
      expect(page).to have_content(@patient2.name)
      expect(page).to have_content(@patient3.name)
    end
  end
end