require 'rails_helper'

RSpec.describe Hospital do
  it {should have_many :doctors}

  describe "#doctor_list" do
    it "returns an array of doctors with patient counts" do
      @hospital = Hospital.create(name: "St. Turing's")
      @doctor1 = @hospital.doctors.create(name: "Dr. Spaceman", specialty: "Psychology", university: "Columbia")
      @doctor2 = @hospital.doctors.create(name: "Dr. Sameplot", specialty: "torsos", university: "DeVry")
      @patient1 = @doctor1.patients.create(name: "Tracy Jordan", age: 40)
      @patient2 = @doctor1.patients.create(name: "Jenna Maroney", age: 39)
      @patient3 = @doctor1.patients.create(name: "Jack Donnaghey", age: 43)
      @patient4 = @doctor2.patients.create(name: "Bart Simpson", age: 10)
      @doctor2.patients << @patient1

      expected = [[@doctor1, @doctor1.patients.count], [@doctor2, @doctor2.patients.count]]
      
      expect(@hospital.doctor_list.first.name).to eq(@doctor1.name)
      expect(@hospital.doctor_list.first.patient_count).to eq(@doctor1.patients.count)
    end
  end
end