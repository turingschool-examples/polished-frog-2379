require "rails_helper"

RSpec.describe Patient, type: :model do
  describe "relationships" do
    it { should have_many(:doctors).through(:doctor_patients) }
  end

  describe "class methods" do
    describe "::adults" do
      it "returns patients over 18 in alphabetical order" do
        p1 = Patient.create!(name: "Katie Bryce", age: 24)
        p2 = Patient.create!(name: "Denny Duquette", age: 39)
        p3 = Patient.create!(name: "Rebecca Pope", age: 32)
        p4 = Patient.create!(name: "Zola Shepherd", age: 2)

        expect(Patient.adults).to eq [p2, p1, p3]
      end
    end
  end
end
