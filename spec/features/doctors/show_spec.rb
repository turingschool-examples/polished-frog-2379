require "rails_helper"

RSpec.describe "doctor show", type: :feature do
  before(:each) do
    @hospital_1 = Hospital.create!(name: 'Grey Sloan')

    @doctor_1 = Doctor.create!(name: 'Meredith Grey', specialty: 'Surgery', education: 'Harvard', hospital: @hospital_1)

    @patient_1 = Patient.create!(name: 'Katie', age: 24)
    @patient_2 = Patient.create!(name: 'Bryce', age: 32)
    @patient_3 = Patient.create!(name: 'Denny', age: 40)

    visit "/doctors/#{@doctor_1.id}"
  end

  describe 'When a user visits a doctor show page, they see information about the doctor' do
    it 'They see doctors name, specialty, and university' do
      expect(page).to have_content("Name: Meredith Grey")
      expect(page).to have_content("Specialty: Surgery")
      expect(page).to have_content("Education: Harvard")
    end

    xit 'They see name of hospital where the doctor works' do
      expect(page).to have_content("Hospital: Grey Sloan")
    end

    xit 'They see name of all patients form this doctor' do
      @doctor_1.patients << @patient_1
      @doctor_1.patients << @patient_2

      expect(page).to have_content("Patients: Katie Bryce")
      expect(page).to have_content("Denny")
    end
  end
end

# User Story 1, Doctors Show Page
# ​
# As a visitor
# When I visit a doctor's show page
# I see all of that doctor's information including:
#  - name
#  - specialty
#  - university where they got their doctorate
# And I see the name of the hospital where this doctor works
# And I see the names of all of the patients this doctor has