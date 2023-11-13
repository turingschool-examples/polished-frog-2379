require "rails_helper"

RSpec.describe Patient do
  it { should have_many :doctor_patients }
  it { should have_many(:doctors).through(:doctor_patients) }

  before :each do
    @patient_1 = Patient.create!(name: "Yuji Itadori", age: 7)
    @patient_2 = Patient.create!(name: "Megumi Fushiguro", age: 14)
    @patient_3 = Patient.create!(name: "Maki Zenin", age: 21)
    @patient_4 = Patient.create!(name: "Toji Fushiguro", age: 28)
  end

  describe "adults_ordered" do
    it "patients are above 18 years old and ordered in alphabetical order" do
      expect(Patient.adults_ordered).to eq([@patient_3, @patient_4])
    end
  end
end
