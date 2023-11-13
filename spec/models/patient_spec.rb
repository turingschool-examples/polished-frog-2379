require 'rails_helper'

RSpec.describe Patient do
  describe "validaitons" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
  end
  describe "relationships" do
    it {should have_many :doctor_patients}
    it {should have_many(:doctors).through(:doctor_patients)}
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

  describe "class methods" do
    describe "adult_sort" do
      it "finds all the patients whose age is greate than 18 and sorts them alphabetically ascending, by name" do
        expect(Patient.adult_sort).to eq([@patient3, @patient2, @patient1, @patient4])
      end
    end
  end
end