require 'rails_helper'

RSpec.describe Hospital do
  it {should have_many :doctors}

  describe '#instance methods' do
    before(:each) do
      @hospital_1 = Hospital.create!(name: 'Grey Sloan')
      @hospital_2 = Hospital.create!(name: 'IDK')

      @doctor_1 = Doctor.create!(name: 'Meredith Grey', specialty: 'Surgery', university: 'Harvard', hospital: @hospital_1)
      @doctor_2 = Doctor.create!(name: 'Sam', specialty: 'Surgery', university: 'Somewhere', hospital: @hospital_1)
      @doctor_3 = Doctor.create!(name: 'Someone', specialty: 'Surgery', university: 'Elsewhere', hospital: @hospital_1)
      @doctor_4 = Doctor.create!(name: 'Bob', specialty: 'Surgery', university: 'Elsewhere', hospital: @hospital_2)

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

      @doctor_2.patients << @patient_1
      @doctor_2.patients << @patient_2
      @doctor_2.patients << @patient_3
      @doctor_2.patients << @patient_4
      @doctor_2.patients << @patient_5
      @doctor_2.patients << @patient_6

      @doctor_3.patients << @patient_1
      @doctor_3.patients << @patient_2

      @doctor_4.patients << @patient_1
      @doctor_4.patients << @patient_3
      @doctor_4.patients << @patient_5
    end

    describe '#sort_by_doctor_patient_count' do
      it 'returns doctors at this hospital sorted by patient count from most to least' do
        expect(@hospital_1.sort_by_doctor_patient_count).to eq([@doctor_2, @doctor_1, @doctor_3])
      end
    end
  end
end