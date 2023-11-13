require 'rails_helper'

RSpec.describe Doctor do
  it {should belong_to :hospital}
  
  describe "it exists" do 
    it "is istantiated with a class of Doctor" do 
      @hospital = Hospital.create!({name: "Seattle Grace"})
      @doctor = Doctor.create!({name: "Dr. Dave", specialty: "Emergency Medicine", university: "University of Chicago", hospital_id: @hospital.id})
  
      expect(@doctor.class).to eq(Doctor)
    end
  
    it "is created with a name, specialty, and unviersity attributes" do 
      @hospital = Hospital.create!({name: "Seattle Grace"})
      @doctor = Doctor.create!({name: "Dr. Dave", specialty: "Emergency Medicine", university: "University of Chicago", hospital_id: @hospital.id})
  
      expect(@doctor.name).to eq("Dr. Dave")
      expect(@doctor.specialty).to eq("Emergency Medicine")
      expect(@doctor.university).to eq("University of Chicago")
    end
  end
end