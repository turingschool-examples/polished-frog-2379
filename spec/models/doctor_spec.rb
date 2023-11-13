require 'rails_helper'

RSpec.describe Doctor do
  before (:each) do
    @hospital = Hospital.create!(name: "Anschutz")
    @dr1 = @hospital.doctors.create!(name: "Dr. Ruth", specialty: "TBD", university: "Georgetown?")
    @dr2 = @hospital.doctors.create!(name: "Dr. John", specialty: "Forensic Pathology", university: "UC")
    @dr3 = @hospital.doctors.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University")
    @deadperson1 = @dr2.patients.create!(name: "John Doe", age: 78)
    @deadperson2 = @dr2.patients.create!(name: "Jane Doe", age: 90)
    @otherpatient1 = Patient.create!(name: "JS Bach", age: 65)
    @otherpatient2 = Patient.create!(name: "Debussy", age: 55)
    @newpatient = @dr3.patients.create!(name: "new", age: 55)
    DoctorPatient.create!(doctor: @dr1, patient: @otherpatient1)
    DoctorPatient.create!(doctor: @dr2, patient: @otherpatient1)
    DoctorPatient.create!(doctor: @dr1, patient: @otherpatient2)
    DoctorPatient.create!(doctor: @dr2, patient: @otherpatient2)
  end
  it {should belong_to :hospital}
  it {should have_many :doctor_patients}
  it {should have_many(:patients).through(:doctor_patients)}
  
  describe 'patient load' do
    it 'should tell how many patients' do
      expect(@dr1.patient_load).to eq(2)
      expect(@dr2.patient_load).to eq(4)
      expect(@dr3.patient_load).to eq(1)  
    end
  end

  describe 'busiest_to_least' do
    it 'lines them up by how many patients they have' do
      expect(Doctor.busiest_to_least).to eq([@dr2, @dr1, @dr3])
    
    end
  
  end

end