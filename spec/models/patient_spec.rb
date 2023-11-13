require 'rails_helper'

RSpec.describe Patient, type: :model do
  describe "relationships" do
    it { should have_many(:doctor_patients) }
    it { should have_many(:doctors).through(:doctor_patients) }
  end

  describe "instance methods" do
    before :each do 
      test_data
    end

    it "over eighteen" do
      expect(@patient1.over_eighteen).to eq(true)
      expect(@patient4.over_eighteen).to eq(false)
    end
  end

  describe "class methods" do
    before :each do 
      test_data
    end

    it "alphabetizes by name" do
      expect(Patient.alphabetize_by_name).to eq([@patient2, @patient1, @patient3, @patient4])
    end
  end
end