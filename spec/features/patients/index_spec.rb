require "rails_helper"

RSpec.describe "the patients index page" do
  before :each do
    @hospital_1 = Hospital.create!(name: "Grey Sloan Memorial Hospital")
    @hospital_2 = Hospital.create!(name: "Seaside Health & Wellness Center")
    @doctor_1 = @hospital_1.doctors.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University")
    @doctor_2 = @hospital_1.doctors.create!(name: "Alex Karev", specialty: "Pediatric Surgery", university: "Johns Hopkins University")
    @patient_1 = @doctor_1.patients.create!(name: "Katie Bryce", age: 24)
    @patient_2 = @doctor_1.patients.create!(name: "Denny Duquette", age: 39)
    @patient_3 = Patient.create!(name: "Rebecca Pope", age: 32)
    @patient_4 = Patient.create!(name: "Zola Shepherd", age: 2)
    @doctor_2.patients << @patient_1
  end

  it "displays the names of all patients over 18" do
    visit patients_path

    expect(page).to have_content(@patient_1.name)
    expect(page).to have_content(@patient_2.name)
    expect(page).to have_content(@patient_3.name)
    expect(page).to_not have_content(@patient_4.name)
  end

  it "patient names are in alphabetical order" do
    visit patients_path

    expect(@patient_2.name).to appear_before(@patient_1.name)
    expect(@patient_1.name).to appear_before(@patient_3.name)
  end
end