require "rails_helper"

RSpec.describe "doctor show", type: :feature do
  describe 'When a user visits a doctor show page, they see information about the doctor' do
    before(:each) do
      @hospital_1 = Hospital.create!(name: 'Grey Sloan')
  
      @doctor_1 = Doctor.create!(name: 'Meredith Grey', specialty: 'Surgery', university: 'Harvard', hospital: @hospital_1)
  
      @patient_1 = Patient.create!(name: 'Katie', age: 24)
      @patient_2 = Patient.create!(name: 'Bryce', age: 32)
      @patient_3 = Patient.create!(name: 'Denny', age: 40)

      @doctor_1.patients << @patient_1
      @doctor_1.patients << @patient_2
  
      visit "/doctors/#{@doctor_1.id}"
    end

    it 'They see doctors name, specialty, and university' do
      expect(page).to have_content("Name: Meredith Grey")
      expect(page).to have_content("Specialty: Surgery")
      expect(page).to have_content("Education: Harvard")
    end

    it 'They see name of hospital where the doctor works' do
      expect(page).to have_content("Hospital: Grey Sloan")
    end

    it 'They see name of all patients form this doctor' do
      expect(page).to have_content("Katie")
      expect(page).to have_content("Bryce")
      expect(page).to_not have_content("Denny")
    end
  end

  describe 'When a user visits doctor show page, they can remove a patient' do
    before(:each) do
      @hospital_1 = Hospital.create!(name: 'Grey Sloan')
  
      @doctor_1 = Doctor.create!(name: 'Meredith Grey', specialty: 'Surgery', university: 'Harvard', hospital: @hospital_1)
      @doctor_2 = Doctor.create!(name: 'Sam', specialty: 'Surgery', university: 'Somewhere', hospital: @hospital_1)
  
      @patient_1 = Patient.create!(name: 'Katie', age: 24)
      @patient_2 = Patient.create!(name: 'Bryce', age: 32)

      @doctor_1.patients << @patient_1
      @doctor_1.patients << @patient_2
      @doctor_2.patients << @patient_2
  
      visit "/doctors/#{@doctor_1.id}"
    end

    it 'They see a button to remove patient from doctor' do
      within "#patient-#{@patient_1.id}" do
        expect(page).to have_selector(:link_or_button, "Delete")
      end

      within "#patient-#{@patient_2.id}" do
        expect(page).to have_selector(:link_or_button, "Delete")
      end
    end

    it 'They click button, are redirected back, no longer see patient, patient is still active on another doctor show page' do
      expect(page).to have_content("Katie")
      expect(page).to have_content("Bryce")

      within "#patient-#{@patient_2.id}" do
        click_button('Delete')
      end

      expect(current_path).to eq("/doctors/#{@doctor_1.id}")
      expect(page).to have_content("Katie")
      expect(page).to_not have_content("Bryce")

      visit "/doctors/#{@doctor_2.id}"

      expect(page).to have_content("Bryce")
    end
  end

end

# User Story 2, Remove a Patient from a Doctor
# ​
# As a visitor
# When I visit a Doctor's show page
# Then next to each patient's name, I see a button to remove that patient from that doctor's caseload
# When I click that button for one patient
# I'm brought back to the Doctor's show page
# And I no longer see that patient's name listed
# And when I visit a different doctor's show page that is caring for the same patient,
# Then I see that the patient is still on the other doctor's caseload

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