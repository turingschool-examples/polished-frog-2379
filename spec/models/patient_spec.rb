require 'rails_helper'

RSpec.describe Patient do
  describe "relationships" do
    it {should have_many :doctors}
  end

  describe "class methods" do
    describe "#adult_patients_alpha" do
      before(:each) do
        @hospital1 = Hospital.create!(name: "General Hospital")

        @doctor1 = @hospital1.doctors.create!(name: "Joseph Lee", specialty: "Pediatrics", university: "Harvard University")
        @doctor2 = @hospital1.doctors.create!(name: "James Smith", specialty: "Heart Surgery", university: "Brown University")

        @patient1 = Patient.create!(name: "Josh Campbell", age: 37)
        @patient2 = Patient.create!(name: "Rebecca Joy", age: 26)
        @patient3 = Patient.create!(name: "Ruby Rails", age: 12)
        @patient4 = Patient.create!(name: "Chris Brown", age: 40)
        
        DoctorPatient.create!(doctor: @doctor1, patient: @patient1)
        DoctorPatient.create!(doctor: @doctor1, patient: @patient2)
        DoctorPatient.create!(doctor: @doctor1, patient: @patient4)
        DoctorPatient.create!(doctor: @doctor2, patient: @patient1)
      end

      it "should return an array of patients only over the age of 18 in alphabetical order" do
        expect(Patient.adult_patients_alpha).to eq([@patient4, @patient1, @patient2])
        #below checks are unnecessary but why not
        expect(Patient.adult_patients_alpha).to_not eq([@patient1, @patient2, @patient3])
        expect(Patient.adult_patients_alpha).to_not eq([@patient4, @patient1, @patient2, @patient3])
      end
    end
  end
end