require 'rails_helper'

RSpec.describe 'the hospital show page' do
  before :each do
    @grace = Hospital.create!(name: "Grace Memorial")
    @seaside = Hospital.create!(name: "Seaside Health & Wellness Center")
    @doctor_4 = @grace.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
    @doctor_1 = @grace.doctors.create!(name: "Lawrence", specialty: "Orthopedics", university: "Anchutz")
    @doctor_2 = @grace.doctors.create!(name: "Charlie", specialty: "Cardiology", university: "Seattle University")
    @doctor_3 = @seaside.doctors.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University")
    @patient_1 = @doctor_1.patients.create!(name: "Steve Harvey", age: 61)
    @patient_2 = @doctor_1.patients.create!(name: "Joe Schmoe", age: 2)
    @patient_3 = @doctor_1.patients.create!(name: "Lorelei Gilmore", age: 17)
    @patient_4 = @doctor_2.patients.create!(name: "Santa Claus", age: 82)
    doctor_patient_1 = DoctorPatient.create!(patient_id: @patient_1.id, doctor_id: @doctor_2.id)
    @patient_5 = @doctor_3.patients.create!(name: "Katie Bryce", age: 24)
    @patient_6 = @doctor_1.patients.create!(name: "Denny Duquette", age: 39)
  end

  describe "User Story 1" do
    it "should have the hospital's name" do
      visit hospital_path(@grace)

      expect(page).to have_content("Grace Memorial")
      expect(page).to_not have_content("Seaside Health & Wellness Center")
    end

    it "should have the hospital's doctor's names" do
      visit hospital_path(@grace)

      expect(page).to have_content(@doctor_1.name)
      expect(page).to have_content(@doctor_2.name)
      expect(page).to_not have_content(@doctor_3.name)
      expect(page).to have_content(@doctor_4.name)
    end

    it "should have the hospital's doctor's numbers of patients" do
      visit hospital_path(@grace)

      within "#doctor-#{@doctor_1.id}" do
        expect(page).to have_content("Number of Patients: 4")
      end
      within "#doctor-#{@doctor_2.id}" do
        expect(page).to have_content("Number of Patients: 2")
      end
      within "#doctor-#{@doctor_4.id}" do
        expect(page).to have_content("Number of Patients: 0")
      end
    end

    it "orders doctors from most to least number of patients" do
      visit hospital_path(@grace)

      expect(@doctor_1.name).to appear_before(@doctor_2.name)
      expect(@doctor_2.name).to appear_before(@doctor_4.name)
    end
  end
end