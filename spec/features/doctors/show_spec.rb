require "rails_helper"

RSpec.describe "the Doctors show page" do
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

  it "should have a button to remove the patient from the doctor's workload and the other doctor still has the patient" do
    within("#patient-#{@patient1.id}") do
      expect(page).to have_content(@patient1.name)
      expect(page).to have_button("Remove")
      click_on("Remove")
      expect(current_path).to eq("/doctors/#{@doctor1.id}")
    end

      expect(page).to_not have_content("#{@patient1.name}")
      expect(@doctor1.patients).to eq([@patient2, @patient4])

      visit doctor_path(@doctor2)
      expect(page).to have_content(@patient1.name)
      expect(@doctor2.patients).to eq([@patient1])
  end
end
