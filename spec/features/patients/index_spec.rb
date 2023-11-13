require 'rails_helper'

RSpec.describe 'Patient Index Page /patients' do
  before :each do
    test_data
  end

  describe 'as a visitor' do
    describe 'when I visit /patients' do
      it 'shows name of all adult patients in ascending alphabetical order' do
        # US 3
        visit "/patients"
        
        expect(page).to have_content("All Adult Patients")
        expect(page).to have_content("List of Patients Name: #{@patient5.name}, #{@patient2.name}, #{@patient1.name}, and #{@patient3.name}")
      end
    end
  end
end