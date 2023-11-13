require 'rails_helper'

RSpec.describe 'Hospital Show Page /hospitals/:hospital_id' do
  before :each do
    test_data    
  end

  describe 'as a visitor' do
    describe 'when I visit /hospitals/:hospital_id' do
      it 'shows list of all the doctors that works there and number of patients for each doctor in order of most to least patients' do
        # Extension 1
        visit "/hospitals/#{@hospital1.id}"

        expect(page).to have_content("Hospital Information")
        expect(page).to have_content("List of Doctors")

        expect(@doc3.name).to appear_before(@doc2.name)
        expect(@doc2.name).to appear_before(@doc1.name)
        expect(@doc1.name).to appear_before(@doc4.name)

        within("#doctor-#{@doc1.id}") do
          expect(page).to have_content("Number of patients: 2")
        end
        
        within("#doctor-#{@doc2.id}") do
          expect(page).to have_content("Number of patients: 3")
        end
        
        within("#doctor-#{@doc3.id}") do
          expect(page).to have_content("Number of patients: 4")
        end
        
        within("#doctor-#{@doc4.id}") do
          expect(page).to have_content("Number of patients: 1")
        end
      end
    end
  end
end