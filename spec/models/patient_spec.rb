require 'rails_helper'

RSpec.describe Patient do
  before :each do
    test_data
  end
  
  it {should have_many :doctor_patients}
  it {should have_many(:doctors).through(:doctor_patients)}

  describe 'adult_patients' do
    it 'shows the list of adult(age>18) patients in alphabetical order' do
      expect(Patient.adult_patients).to eq([@patient5.name, @patient2.name, @patient1.name, @patient3.name])
    end
  end
end