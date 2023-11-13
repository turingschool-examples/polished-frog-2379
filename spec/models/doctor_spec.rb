require 'rails_helper'

RSpec.describe Doctor do
  it { should belong_to :hospital }
  it { should have_many :doctor_patients }
  it { should have_many(:patients).through(:doctor_patients) }

  describe '#instance methods' do
    before(:each) do
      @hospital_1 = Hospital.create!(name: 'Grey Sloan')

      @doctor_1 = Doctor.create!(name: 'Meredith Grey', specialty: 'Surgery', university: 'Harvard', hospital: @hospital_1)

      @patient_1 = Patient.create!(name: 'Katie', age: 18)
      @patient_2 = Patient.create!(name: 'Denny', age: 19)
      @patient_3 = Patient.create!(name: 'Bryce B', age: 35)
    end

    describe '#patient_count' do
      it 'return total count of patients' do
        expect(@doctor_1.patient_count).to eq(0)

        @doctor_1.patients << @patient_1
        @doctor_1.patients << @patient_2
        @doctor_1.patients << @patient_2

        expect(@doctor_1.patient_count).to eq(2)
      end
    end
  end
end