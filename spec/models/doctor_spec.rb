require 'rails_helper'

RSpec.describe Doctor do
  
  describe "relationships" do 
    it { should belong_to :hospital }
    it { should have_many :patient_doctors }
    it { should have_many(:patients).through(:patient_doctors) }
  end

  describe "validations" do 
    it { should validate_presence_of :name }
    it { should validate_presence_of :specialty }
    it { should validate_presence_of :education }
  end
  
  describe "it exists" do 
    it "is istantiated with a class of Doctor" do 
      @hospital = Hospital.create!({name: "Seattle Grace"})
      @doctor = Doctor.create!({name: "Dr. Dave", specialty: "Emergency Medicine", education: "University of Chicago", hospital_id: @hospital.id})
  
      expect(@doctor.class).to eq(Doctor)
    end
  
    it "is created with a name, specialty, and unviersity attributes" do 
      @hospital = Hospital.create!({name: "Seattle Grace"})
      @doctor = Doctor.create!({name: "Dr. Dave", specialty: "Emergency Medicine", education: "University of Chicago", hospital_id: @hospital.id})
  
      expect(@doctor.name).to eq("Dr. Dave")
      expect(@doctor.specialty).to eq("Emergency Medicine")
      expect(@doctor.education).to eq("University of Chicago")
    end
  end
end