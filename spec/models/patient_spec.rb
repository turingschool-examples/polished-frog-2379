require "rails_helper"

RSpec.describe Patient, type: :model do
  describe "relationships" do
    it { should have_many(:patient_doctors) }
    it { should have_many(:doctors).through(:patient_doctors) }
  end

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
  end

  describe "#adults_alpha" do
    it "returns the name strings of all patients" do
      @hospital = Hospital.create(name: "St. Turings")
      @doctor1 = @hospital.doctors.create(name: "Dr. Spaceman", specialty: "Psychology", university: "Columbia")
      @doctor2 = @hospital.doctors.create(name: "Dr. Sameplot", specialty: "torsos", university: "DeVry")
      @patient1 = @doctor1.patients.create(name: "Tracy Jordan", age: 40)
      @patient2 = @doctor1.patients.create(name: "Jenna Maroney", age: 39)
      @patient3 = @doctor1.patients.create(name: "Jack Donnaghey", age: 43)
      @patient4 = @doctor2.patients.create(name: "Bart Simpson", age: 10)

      expected = [@patient3.name, @patient2.name, @patient1.name]

      expect(Patient.adults_alpha_names).to eq(expected)
    end
  end
end 
