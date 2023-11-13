require "rails_helper"

RSpec.describe "hospital show", type: :feature do
  describe 'When a user visits a hospital show page, there is information' do
    before(:each) do
      @hospital_1 = Hospital.create!(name: 'Grey Sloan')
      @hospital_2 = Hospital.create!(name: 'IDK')
  
      @doctor_1 = Doctor.create!(name: 'Meredith Grey', specialty: 'Surgery', university: 'Harvard', hospital: @hospital_1)
      @doctor_2 = Doctor.create!(name: 'Sam', specialty: 'Surgery', university: 'Somewhere', hospital: @hospital_1)
      @doctor_3 = Doctor.create!(name: 'Someone', specialty: 'Surgery', university: 'Elsewhere', hospital: @hospital_1)
      @doctor_3 = Doctor.create!(name: 'Bob', specialty: 'Surgery', university: 'Elsewhere', hospital: @hospital_2)
  
      @patient_1 = Patient.create!(name: 'Katie', age: 18)
      @patient_2 = Patient.create!(name: 'Denny', age: 19)
      @patient_3 = Patient.create!(name: 'Bryce B', age: 35)
      @patient_4 = Patient.create!(name: 'Bryce T', age: 40)
      @patient_5 = Patient.create!(name: 'Abby', age: 55)
      @patient_6 = Patient.create!(name: 'Abby', age: 25)

      @doctor_1.patients << @patient_1
      @doctor_1.patients << @patient_2
      @doctor_1.patients << @patient_3
      @doctor_1.patients << @patient_4

      @doctor_2.patients << @patient_1
      @doctor_2.patients << @patient_2
      @doctor_2.patients << @patient_3
      @doctor_2.patients << @patient_4
      @doctor_2.patients << @patient_5
      @doctor_2.patients << @patient_6
  
      @doctor_3.patients << @patient_1
      @doctor_3.patients << @patient_2

      visit "/hospitals/#{@hospital_1.id}"
    end

    it 'They see hospitals name and name of all doctors that work at this hospital' do
      expect(page).to have_content('Hospital: Grey Sloan')
      expect(page).to have_content('Meredith Grey')
      expect(page).to have_content('Sam')
      expect(page).to have_content('Someone')
      expect(page).to_not have_content('Bob')
    end

    it 'They see number of patients associated with the doctor' do
      within "#doctor-#{@doctor_1.id}" do
        expect(page).to have_content('Meredith Grey: 4 patients')
      end

      within "#doctor-#{@doctor_2.id}" do
        expect(page).to have_content('Sam: 6 patients')
      end

      within "#doctor-#{@doctor_3.id}" do
        expect(page).to have_content('Someone: 2 patients')
      end
    end

    it 'They doctors orderd from most patients to least' do
      expect('Sam').to appear_before('Meredith Grey')
      expect('Meredith Grey').to appear_before('Someone')
    end
  end

#   Extension, Hospital Show Page
# ​
# As a visitor
# When I visit a hospital's show page
# I see the hospital's name
# And I see the names of all doctors that work at this hospital,
# And next to each doctor I see the number of patients associated with the doctor,
# And I see the list of doctors is ordered from most number of patients to least number of patients
# (Doctor patient counts should be a single query)