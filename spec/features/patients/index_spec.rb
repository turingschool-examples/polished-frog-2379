require "rails_helper"

RSpec.describe "patient index", type: :feature do
  describe 'When a user visits a patients index page, they see list of patients' do
    before(:each) do
      @hospital_1 = Hospital.create!(name: 'Grey Sloan')
      @hospital_2 = Hospital.create!(name: 'IDK')
  
      @doctor_1 = Doctor.create!(name: 'Meredith Grey', specialty: 'Surgery', university: 'Harvard', hospital: @hospital_1)
      @doctor_2 = Doctor.create!(name: 'Sam', specialty: 'Surgery', university: 'Somewhere', hospital: @hospital_2)
  
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
      @doctor_2.patients << @patient_3
      @doctor_2.patients << @patient_4
      @doctor_2.patients << @patient_5
      @doctor_2.patients << @patient_6
  
      visit "/patients"
    end

    it 'They see only patents ABOVE 18, should be unique list' do
      expect(page).to_not have_content('Katie')

      expect(page).to have_content('Abby', count: 2)
      expect(page).to have_content('Denny')
      expect(page).to have_content('Bryce T')
      expect(page).to have_content('Bryce B')
    end

    it 'They see patients in alphabetical order' do
      expect('Abby').to appear_before('Bryce B')
      expect('Bryce B').to appear_before('Bryce T')
      expect('Bryce T').to appear_before('Denny')
    end
  end

end

# User Story 3, Patient Index Page
# ​
# As a visitor
# When I visit the patient index page
# I see the names of all adult patients (age is greater than 18),
# And I see the names are in ascending alphabetical order (A - Z, you do not need to account for capitalization)