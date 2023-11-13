require 'rails_helper'

RSpec.describe 'Doctors Show Page /doctors/:doctor_id' do
  before :each do
    test_data
  end

  describe 'as a visitor' do
    describe 'when I visit /doctors/:doctors_id' do
      it 'shows doctors info including name, specialty and university attended' do
        #US 1
        visit "/doctors/#{@doc1.id}"
        
        expect(page).to have_content("Doctor's Information")
        expect(page).to have_content("Doctor's Name: #{@doc1.name}")
        expect(page).to have_content("Doctor's Name: #{@doc1.specialty}")
        expect(page).to have_content("Doctor's Name: #{@doc1.university}")
      end

      it 'shows the name of the hospital they work and list of patients' do
        #US 1
        visit "/doctors/#{@doc1.id}"

        expect(page).to have_content("Hospital Name: Grey Sloan Memorial Hospital")
        expect(page).to have_content("List of Patients:\n#{@patient1.name}\n#{@patient4.name}")
      end
    end
  end
end