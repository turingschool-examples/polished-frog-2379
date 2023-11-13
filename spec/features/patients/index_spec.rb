require "rails_helper"

RSpec.describe "the Patients index page" do
  before(:each) do
    @hospital1 = Hospital.create!(name: "General Hospital")

    @doctor1 = @hospital1.doctors.create!(name: "Joseph Lee", specialty: "Pediatrics", university: "Harvard University")
    @doctor2 = @hospital1.doctors.create!(name: "James Smith", specialty: "Heart Surgery", university: "Brown University")

    @patient1 = Patient.create!(name: "Josh Campbell", age: 37)
    @patient2 = Patient.create!(name: "Rebecca Joy", age: 26)
    @patient3 = Patient.create!(name: "Ruby Rails", age: 12)
    @patient4 = Patient.create!(name: "Chris Brown", age: 40)
    
    DoctorPatient.create!(doctor: @doctor1, patient: @patient1)
    DoctorPatient.create!(doctor: @doctor1, patient: @patient2)
    DoctorPatient.create!(doctor: @doctor1, patient: @patient4)
    DoctorPatient.create!(doctor: @doctor2, patient: @patient1)
    visit patients_path
  end

  it "should display the names of all adult patients (older than 18) in ascending alphabetical order" do
    expect(page).to have_content("List of all Adult Patients")
    expect(page).to have_content("#{@patient4.name}")
    expect(page).to have_content("#{@patient1.name}")
    expect(page).to have_content("#{@patient2.name}")
    expect(page).to_not have_content("#{@patient3.name}")

    expect("#{@patient4.name}").to appear_before(@patient1.name)
    expect("#{@patient1.name}").to appear_before(@patient2.name)
  end
end
