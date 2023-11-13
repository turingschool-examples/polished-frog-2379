require 'rails_helper'

RSpec.describe Hospital do
  describe "validaitons" do
    it { should validate_presence_of :name }
  end
  describe "relationships" do
    it {should have_many :doctors}
    it {should have_many(:doctor_patients).through(:doctors)}
    it {should have_many(:patients).through(:doctor_patients)}
  end

  before(:each) do
    @hospital1 = Hospital.create!(name: "Muppet MD")
   
    @doctor1 = @hospital1.doctors.create!(name: "Kermit", specialty: "legs and tounge", university: "Frog U Mississippi" )
    @doctor2 = @hospital1.doctors.create!(name: "Fozzie", specialty: "fur and humor(s)", university: "Bear Comedy College" )
    
    @patient1 = Patient.create!(name: "Rolff", age: 40 )
    @patient2 = Patient.create!(name: "Rizzo", age: 45 )
    @patient3 = Patient.create!(name: "Gonzo", age: 50 )
    @patient4 = Patient.create!(name: "Scooter", age: 35 )
    
    @patient5 = Patient.create!(name: "Robin the Frog", age: 16 )

    @doc_pat1 = DoctorPatient.create!(doctor: @doctor1, patient: @patient1)
    @doc_pat2 = DoctorPatient.create!(doctor: @doctor1, patient: @patient2)
    @doc_pat3 = DoctorPatient.create!(doctor: @doctor1, patient: @patient3)

    @doc_pat7 = DoctorPatient.create!(doctor: @doctor1, patient: @patient5)

    @doc_pat4 = DoctorPatient.create!(doctor: @doctor2, patient: @patient2)
    @doc_pat5 = DoctorPatient.create!(doctor: @doctor2, patient: @patient3)
    @doc_pat6 = DoctorPatient.create!(doctor: @doctor2, patient: @patient4)

  end

  describe "instance methods" do
    describe "doctor_pat_sort" do
      it "finds all the doctors in a hospital and counts the amount of patients a doctor has and groups them 
      from most patients to least" do
        expect(@hospital1.doctor_pat_sort).to eq([@doctor1, @doctor2])
      end
    end
  end
end