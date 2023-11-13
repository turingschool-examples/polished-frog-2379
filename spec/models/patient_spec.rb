require 'rails_helper'

RSpec.describe Patient do
  before :each do
    test_data
  end

  describe '#Relationships' do
    it {should have_many :doctor_patients}
    it {should have_many(:doctors).through(:doctor_patients)}
  end

  describe '#self.sorted_patients' do
    it 'can sort the order of patients by age above 18 and in ascending alphabetical order' do
      patients = Patient.all.find_all{|p| p.age >= 18}.uniq.sort_by{|p| p.name}
      expect(Patient.sorted_patients).to eq(patients)
    end
  end
end