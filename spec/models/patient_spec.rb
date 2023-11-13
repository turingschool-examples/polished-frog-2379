require "rails_helper"

RSpec.describe Patient, type: :model do
  describe "relationships" do
    it {should have_many :doctor_patients}
    it {should have_many(:doctors).through(:doctor_patients)}
  end

  describe "class methods" do
    before :each do
      Patient.destroy_all
      @patient_1 = Patient.create!(name: "Katie Bryce", age: 24)
      @patient_2 = Patient.create!(name: "Denny Duquette", age: 39)
      @patient_3 = Patient.create!(name: "Rebecca Pope", age: 32)
      @patient_4 = Patient.create!(name: "Zola Shepherd", age: 2)
    end
  
    it ".adults_alphabetical"do
      expect(Patient.adults_alphabetical).to eq([@patient_2.name, @patient_1.name, @patient_3.name])
    end
  end
end