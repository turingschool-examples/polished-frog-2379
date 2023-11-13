require 'rails_helper'

RSpec.describe Doctor do
  describe "associations" do
    it {should belong_to :hospital}
    it {should have_many :patient_doctors}
    it {should have_many(:patients).through(:patient_doctors)}
  end

  before :each do
    @hospital1 = Hospital.create!(name: "UC")
    @hospital2 = Hospital.create!(name: "UTMB")
    @doctor1 = @hospital1.doctors.create!(name: "Doctor 1", specialty: "Rheum", university: "LSU")
    @doctor2 = @hospital2.doctors.create!(name: "Doctor 2", specialty: "Gastro", university: "MSU")
    @doctor3 = @hospital2.doctors.create!(name: "Doctor 3", specialty: "Card", university: "KSU")
    @doctor4 = @hospital1.doctors.create!(name: "Doctor 4", specialty: "ENT", university: "NSU")
    @doctor5 = @hospital2.doctors.create!(name: "Doctor 5", specialty: "Ortho", university: "OSU")
    @patient1 = @doctor1.patients.create!(name: "bPatient 1", age: 10)
    @patient2 = @doctor1.patients.create!(name: "cPatient 2", age: 20)
    @patient3 = @doctor2.patients.create!(name: "kPatient 3", age: 50)
    @patient4 = @doctor1.patients.create!(name: "rPatient 4", age: 40)
    @patient5 = @doctor3.patients.create!(name: "mPatient 5", age: 18)
    @patient6 = @doctor3.patients.create!(name: "aPatient 6", age: 70)
    @doctor4.patients << @patient1
    @doctor4.patients << @patient2
  end

  describe "instance methods" do
    it "#patient_count_formatted" do
      expect(@doctor1.patient_count_formatted).to eq("Doctor 1, Patients: 3")
      expect(@doctor5.patient_count_formatted).to eq("Doctor 5, Patients: 0")
    end
  end

end