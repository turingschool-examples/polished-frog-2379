require 'rails_helper'

RSpec.describe 'Doctor show page' do
  before(:each) do
    @hospital = Hospital.create!(name: 'Grey Sloan Memorial Hospital')
    @doctor_1 = Doctor.create!(name: 'Meredith Grey', specialty: 'General Surgery', university: 'Harvard University', hospital_id: @hospital.id)
    @doctor_2 = Doctor.create!(name: 'Jason Bourne', specialty: 'General Surgery', university: 'Harvard University', hospital_id: @hospital.id)
    @patient_1 = Patient.create!(name: 'Katie Bryce', age: 24)
    @patient_2 = Patient.create!(name: 'Denny Duquette', age: 39)
    @patient_3 = Patient.create!(name: 'Rebecca Pope', age: 32)
    DoctorPatient.create!(doctor_id: @doctor_1.id, patient_id: @patient_1.id)
    DoctorPatient.create!(doctor_id: @doctor_2.id, patient_id: @patient_1.id)
    DoctorPatient.create!(doctor_id: @doctor_1.id, patient_id: @patient_2.id)
    DoctorPatient.create!(doctor_id: @doctor_1.id, patient_id: @patient_3.id)
  end

  describe 'US 1 - As a visitor' do
    it 'I see all of that doctors information' do
      visit doctor_path(@doctor_1)

      expect(page).to have_content(@doctor_1.name)
      expect(page).to have_content(@doctor_1.specialty)
      expect(page).to have_content(@doctor_1.university)
    end

    it 'I see the name of the hospital where this doctor works' do
      visit doctor_path(@doctor_1)

      expect(page).to have_content(@hospital.name)
    end

    it 'I see the names of all of the patients this doctor has' do
      visit doctor_path(@doctor_1)

      expect(page).to have_content(@patient_1.name)
      expect(page).to have_content(@patient_2.name)
      expect(page).to have_content(@patient_3.name)
    end
  end


  describe 'US 2 - As a visitor' do
    it 'I can remove a patient from a doctor' do
      visit doctor_path(@doctor_1)

      
      expect(page).to have_content(@patient_1.name)
      expect(page).to have_content(@patient_2.name)
      expect(page).to have_content(@patient_3.name)

      within "#patient-#{@patient_1.id}" do
        click_button 'Remove'
      end
      

      expect(page).not_to have_content(@patient_1.name)
    
      expect(page).to have_content(@patient_2.name)
      expect(page).to have_content(@patient_3.name)

      visit doctor_path(@doctor_2)
      expect(page).to have_content(@patient_1.name)
    end
  end
end
