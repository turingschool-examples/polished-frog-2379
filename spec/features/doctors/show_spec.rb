require "rails_helper"

RSpec.describe "the Doctors show page" do
  before(:each) do
    @hospital1 = Hospital.create!(name: "General Hospital")

    @doctor1 = @hospital1.doctors.create!(name: "Joseph Lee", specialty: "Pediatrics", university: "Harvard University")

    @patient1 = Patient.create!(name: "Josh Campbell", age: 37)
    @patient2 = Patient.create!(name: "Rebecca Joy", age: 26)
    @patient3 = Patient.create!(name: "Ruby Rails", age: 12)
    @patient4 = Patient.create!(name: "Chris Brown", age: 40)
    
    DoctorPatient.create!(doctor: @doctor1, patient: @patient1)
    DoctorPatient.create!(doctor: @doctor1, patient: @patient2)
    DoctorPatient.create!(doctor: @doctor1, patient: @patient4)
    visit doctor_path(@doctor1)
  end

  it "should display the doctor's information, the hospital they work at, and the names of all of their patients" do
    expect(page).to have_content("Dr. #{@doctor1.name}")
    expect(page).to have_content("Speciality: #{@doctor1.specialty}")
    expect(page).to have_content("University: #{@doctor1.university}")
    expect(page).to have_content("Hospital: #{@hospital1.name}")
    expect(page).to have_content("List of Patients")
    expect(page).to have_content("#{@patient1.name}")
    expect(page).to have_content("#{@patient2.name}")
    expect(page).to have_content("#{@patient4.name}")
  end
end
