require 'rails_helper'

RSpec.describe Doctor do
  describe "relationships" do
    it { should belong_to :hospital }
    it { should have_many(:patients).through(:doctor_patients) }
  end

  describe "methods" do
    before :each do
      @grace = Hospital.create!(name: "Grace Memorial")
      @doctor_1 = @grace.doctors.create!(name: "Lawrence", specialty: "Orthopedics", university: "Anchultz")
      @doctor_2 = @grace.doctors.create!(name: "Charlie", specialty: "Cardiology", university: "Seattle University")
      @doctor_3 = @grace.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
      @patient_1 = @doctor_1.patients.create!(name: "Steve Harvey", age: 61)
      @patient_2 = @doctor_1.patients.create!(name: "Joe Schmoe", age: 2)
      @patient_3 = @doctor_1.patients.create!(name: "Lorelei Gilmore", age: 17)
      @patient_4 = @doctor_2.patients.create!(name: "Santa Claus", age: 82)
      doctor_patient_1 = DoctorPatient.create!(patient_id: @patient_1.id, doctor_id: @doctor_2.id)
      @patient_5 = @doctor_1.patients.create!(name: "Denny Duquette", age: 39)
    end

    describe "#hospital_name" do
      it "provides the name of the hospital that the doctor works at" do
        expect(@doctor_1.hospital_name).to eq("Grace Memorial")
      end
    end

    describe "#patients_count" do
      it "gives the number of patients in a doctor's caseload" do
        expect(@doctor_1.patients_count).to eq(4)
        expect(@doctor_2.patients_count).to eq(2)
        expect(@doctor_3.patients_count).to eq(0)
      end
    end


    describe "#patients_count_desc" do
      it "gives doctors in descending order of the number of patients in a doctor's caseload" do
        expect(Doctor.patients_count_desc).to eq([@doctor_1, @doctor_2, @doctor_3])
      end
    end
  end
end