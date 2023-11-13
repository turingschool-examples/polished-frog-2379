require "rails_helper"

RSpec.describe "Doctor Show Page" do
  before(:each) do
    test_data
    visit doctor_path(@meredith)
  end

  describe '#USER STORY 1: DOCTOR SHOW PAGE' do
    it 'when visiting the show page, it shows the name, specialty, and university of the doctor' do
      expect(page).to have_content(@meredith.name)
      expect(page).to have_content(@meredith.specialty)
      expect(page).to have_content(@meredith.university)
    end

    it 'includes the name of the hospital where the doctor works' do
      expect(page).to have_content(@greysloan.name)
    end

    it 'has all of the patients that belong to this doctor' do
      patients = @meredith.patients
      patients.each do |p|
        expect(page).to have_content(p.name)
      end
    end
    
  end

end