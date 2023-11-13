require "rails_helper"

RSpec.describe "Doctors Show Page" do 
  before(:each) do 
    @hospital = Hospital.create!({name: "Seattle Grace"})
    @doctor = Doctor.create!({name: "Dr. Dave", specialty: "Emergency Medicine", university: "University of Chicago", hospital_id: @hospital.id})
    @doctor2 = Doctor.create!({name: "Dr. John", specialty: "Heart Surgeon", university: "Harvard Medical", hospital_id: @hospital.id})

    @patient0 = Patient.create!({name: "Patient Zero", age: 26})
    @patient1 = Patient.create!({name: "Patient One", age: 39})

    @patient0_doctor = PatientDoctor.create!({patient_id: @patient0.id, doctor_id: @doctor.id})
    @patient0_doctor2 = PatientDoctor.create!({patient_id: @patient0.id, doctor_id: @doctor2.id})
    @patient1_doctor = PatientDoctor.create!({patient_id: @patient1.id, doctor_id: @doctor.id})
    @patient1_doctor2 = PatientDoctor.create!({patient_id: @patient1.id, doctor_id: @doctor2.id})
   end

  it "displays a doctor's name, specialty, and university where they received doctorate" do 

    visit "/doctors/#{@doctor.id}"

    expect(page).to have_content("Name: Dr. Dave")
    expect(page).to have_content("Specialty: Emergency Medicine")
    expect(page).to have_content("University: University of Chicago")

    expect(page).to have_content("Hospital: Seattle Grace")

    expect(page).to have_content("Dr. Dave's Patients")
    expect(page).to have_content("Patient Zero")
    expect(page).to have_content("Patient One")
  end

  it "can remove a patient from a doctor" do 

    visit "/doctors/#{@doctor.id}"

    @doctor.patients.each do |patient|
      within "#patient-doctor-#{patient.id}" do
       expect(page).to have_content(patient.name)
       expect(page).to have_button("Remove")
       click_button "Remove"
      end
    end

    visit "/doctors/#{@doctor.id}" 
    
    expect(page).to_not have_content("Patient Zero")

    visit "/doctors/#{@doctor2.id}"

    within "#patient-doctor-#{@patient0.id}" do 
      expect(page).to have_content("Patient Zero")
    end
  end

end 