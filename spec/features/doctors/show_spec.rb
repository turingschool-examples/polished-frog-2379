require "rails_helper"

RSpec.describe "the doctor show page" do
  before :each do
    @hospital_1 = Hospital.create!(name: "Grey Sloan Memorial Hospital")
    @hospital_2 = Hospital.create!(name: "Seaside Health & Wellness Center")
    @doctor_1 = @hospital_1.doctors.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University")
    @patient_1 = @doctor_1.patients.create!(name: "Katie Bryce", age: 24)
    @patient_2 = @doctor_1.patients.create!(name: "Denny Duquette", age: 39)
    @patient_3 = Patient.create!(name: "Rebecca Pope", age: 32)
  end

  it "displays all of the doctor's information" do
    visit doctor_path(@doctor_1)

    expect(page).to have_content(@doctor_1.name)
    expect(page).to have_content(@doctor_1.specialty)
    expect(page).to have_content(@doctor_1.university)
  end

  it "displays the doctor's hospital and patients" do
    visit doctor_path(@doctor_1)

    expect(page).to have_content(@hospital_1.name)
    expect(page).to have_content(@patient_1.name)
    expect(page).to have_content(@patient_2.name)
    expect(page).to_not have_content(@hospital_2.name)
    expect(page).to_not have_content(@patient_3.name)
  end
end