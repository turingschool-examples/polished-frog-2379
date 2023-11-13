require 'rails_helper'

RSpec.describe Doctor do

  before :each do
    test_data
  end

  describe '#Relationships' do
    it {should belong_to :hospital}
    it {should have_many :doctor_patients}
    it {should have_many(:patients).through(:doctor_patients)}
  end

  describe '#USER STORY 1: DOCTOR SHOW PAGE' do
    it 'when visiting the show page, it shows the name, specialty, and university of the doctor' do
      expect().to eq()
    end
  end

end