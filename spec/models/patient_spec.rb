require "rails_helper"

RSpec.describe Patient, type: :model do
  describe "relationships" do
    it { should have_many :doctor_patients }
    it { should have_many(:doctors).through(:doctor_patients) }
  end

  describe '::class methods' do
    describe '::alphabetical_adults' do
      before(:each) do
        @hospital_1 = Hospital.create!(name: 'Grey Sloan')
        @hospital_2 = Hospital.create!(name: 'IDK')
    
        @doctor_1 = Doctor.create!(name: 'Meredith Grey', specialty: 'Surgery', university: 'Harvard', hospital: @hospital_1)
        @doctor_2 = Doctor.create!(name: 'Sam', specialty: 'Surgery', university: 'Somewhere', hospital: @hospital_2)
    
        @patient_1 = Patient.create!(name: 'Katie', age: 18)
        @patient_2 = Patient.create!(name: 'Denny', age: 19)
        @patient_3 = Patient.create!(name: 'Bryce B', age: 35)
        @patient_4 = Patient.create!(name: 'Bryce T', age: 40)
        @patient_5 = Patient.create!(name: 'Abby', age: 55)
        @patient_6 = Patient.create!(name: 'Abby', age: 25)
  
        @doctor_1.patients << @patient_1
        @doctor_1.patients << @patient_2
        @doctor_1.patients << @patient_3
        @doctor_1.patients << @patient_4
  
        @doctor_2.patients << @patient_3
        @doctor_2.patients << @patient_4
        @doctor_2.patients << @patient_5
        @doctor_2.patients << @patient_6
      end

      it 'returns list of patients in alphabetical order and aged older than 18' do
        expect(Patient.alphabetical_adults).to eq([@patient_5, @patient_6, @patient_3, @patient_4, @patient_2])
      end
    end
  end
end