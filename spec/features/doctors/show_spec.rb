require "rails_helper"

RSpec.describe "the doctor show page" do
  before :each do
    @hospital_1 = Hospital.create!(name: "Grey Sloan Memorial Hospital")
    @hospital_2 = Hospital.create!(name: "Seaside Health & Wellness Center")
    @doctor_1 = @hospital_1.doctors.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University")
    @doctor_2 = @hospital_1.doctors.create!(name: "Alex Karev", specialty: "Pediatric Surgery", university: "Johns Hopkins University")
    @patient_1 = @doctor_1.patients.create!(name: "Katie Bryce", age: 24)
    @patient_2 = @doctor_1.patients.create!(name: "Denny Duquette", age: 39)
    @patient_3 = Patient.create!(name: "Rebecca Pope", age: 32)
    @doctor_2.patients << @patient_1
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

  it "has a button next to each patient to remove" do
    visit doctor_path(@doctor_1)

    within("#remove-#{@patient_1.id}") do
      expect(page).to have_button("Remove")
    end
  end

  it "clicking the remove button removes the patient and redirects back" do
    visit doctor_path(@doctor_1)

    within("#remove-#{@patient_1.id}") do
      click_button "Remove"
    end

    expect(current_path).to eq(doctor_path(@doctor_1))
    expect(page).to_not have_content(@patient_1.name)
  end

  it "removing a patient from one doctor does not affect other doctors" do
    visit doctor_path(@doctor_1)

    within("#remove-#{@patient_1.id}") do
      click_button "Remove"
    end

    visit doctor_path(@doctor_2)

    expect(page).to have_content(@patient_1.name)
  end
end