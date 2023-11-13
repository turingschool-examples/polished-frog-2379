require 'rails_helper'

RSpec.describe Patient do
  it { should have_many(:doctor_patients) }
  it { should have_many(:doctors).through(:doctor_patients) }

  describe "#adults" do
    it "displays all patients over 18 and in alphabetical order" do
      @patient1 = Patient.create!(name: "Katie Bryce", age: 24)
      @patient2 = Patient.create!(name: "Denny Duquette", age: 39)
      @patient3 = Patient.create!(name: "Rebecca Pope", age: 32)
      @patient4 = Patient.create!(name: "Zola Shephard", age: 2)
      expect(Patient.adults).to eq([@patient2, @patient1, @patient3])
    end
  end
end