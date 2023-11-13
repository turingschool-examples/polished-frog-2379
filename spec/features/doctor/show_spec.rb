require "rails_helper"

RSpec.describe "doctor show page" do
  before :each do
    @hospital = Hospital.create(name: "St. Turing's")
    @doctor1 = @hospital.doctors.create(name: "Dr. Spaceman", specialty: "Psychology", university: "Columbia")
    @patient1 = @doctor1.patients.create(name: "Tracy Jordan", age: 40)
    @patient2 = @doctor1.patients.create(name: "Jenna Maroney", age: 39)
    @patient3 = @doctor1.patients.create(name: "Jack Donnaghey", age: 43)
    @doctor2 = @hospital.doctors.create(name: "Dr. Sameplot", specialty: "torsos", university: "DeVry")
    @doctor2.patients << @patient1
  end

# User Story 1, Doctors Show Page
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

#  User Story 2, Remove a Patient from a Doctor
# As a visitor
# When I visit a Doctor's show page
# Then next to each patient's name, I see a button to remove that patient from that doctor's caseload
# When I click that button for one patient
# I'm brought back to the Doctor's show page
# And I no longer see that patient's name listed
# And when I visit a different doctor's show page that is caring for the same patient,
# Then I see that the patient is still on the other doctor's caseload

  it "can remove a doctor-patient association" do 
    visit doctor_path(@doctor1.id)
    within("#patient-#{@patient1.id}") do
      expect(page).to have_button("Delete Patient ##{@patient1.id}")
      click_button("Delete Patient ##{@patient1.id}")
      expect(current_path).to eq(doctor_path(@doctor1.id))
    end

    expect(page).to_not have_content("#{@patient1.name}")
    visit doctor_path(@doctor2.id)
    expect(page).to have_content("#{@patient1.name}")
  end
end