require 'rails_helper'

RSpec.describe Doctor do
  before :each do
    test_data
  end

  it {should belong_to :hospital}
  it {should have_many :doctor_patients}
  it {should have_many(:patients).through(:doctor_patients)}

  describe 'patients_count' do
    it 'counts the number of patients a doctor has' do
      expect(@doc1.patients_count).to eq(2)
    end
  end

  describe 'order_doctors_by_patients' do
    it 'orders doctors by number of patient desc' do
      expect(Doctor.order_doctors_by_patients).to eq([@doc3, @doc2, @doc1, @doc4])
    end
  end
end