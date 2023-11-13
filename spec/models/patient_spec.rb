require 'rails_helper'

RSpec.describe Patient do
  describe "relationships" do
    it { should have_many(:doctors).through(:doctor_patients) }
    it { should have_many :doctor_patients }
  end

  describe "#methods" do
    before :each do
      @grace = Hospital.create!(name: "Grace Memorial")
      @doctor_1 = @grace.doctors.create!(name: "Lawrence", specialty: "Orthopedics", university: "Anchultz")
      @doctor_2 = @grace.doctors.create!(name: "Charlie", specialty: "Cardiology", university: "Seattle University")
      @patient_1 = @doctor_1.patients.create!(name: "Steve Harvey", age: 61)
      @patient_2 = @doctor_1.patients.create!(name: "Joe Schmoe", age: 2)
      @patient_3 = @doctor_1.patients.create!(name: "Lorelei Gilmore", age: 17)
      @patient_4 = @doctor_2.patients.create!(name: "Santa Claus", age: 82)
      @patient_5 = @doctor_2.patients.create!(name: "Misses Claus", age: 84)
    end

    describe "#alphabetical_adult" do
      it "can list all adults in alphabetical order" do
        expect(Patient.alphabetical_adult).to eq([@patient_5, @patient_4, @patient_1])
      end
    end
  end
end