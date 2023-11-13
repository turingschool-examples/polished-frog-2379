require 'rails_helper'

RSpec.describe Doctor do

  describe "relationships" do
    it {should belong_to :hospital}
    it {should have_many(:patients).through(:doctor_patients) }
  end

  describe "methods" do
    before :each do
      @grace = Hospital.create!(name: "Grace Memorial")
      @doctor_1 = @grace.doctors.create!(name: "Lawrence", specialty: "Orthopedics", university: "Anchultz")
      @doctor_2 = @grace.doctors.create!(name: "Charlie", specialty: "Cardiology", university: "Seattle University")
      @patient_1 = @doctor_1.patients.create!(name: "Steve Harvey", age: 61)
      @patient_2 = @doctor_1.patients.create!(name: "Joe Schmoe", age: 2)
      @patient_3 = @doctor_1.patients.create!(name: "Lorelei Gilmore", age: 17)
      @patient_4 = @doctor_2.patients.create!(name: "Santa Claus", age: 82)
    end

    describe "#hospital_name" do
      it "provides the name of the hospital that the doctor works at" do
        expect(@doctor_1.hospital_name).to eq("Grace Memorial")
      end
    end
  end
end