require 'rails_helper'

RSpec.describe "hospital show" do
  before (:each) do
    @hospital = Hospital.create!(name: "Anschutz")
    @dr1 = @hospital.doctors.create!(name: "Dr. Ruth", specialty: "TBD", university: "Georgetown?")
    @dr2 = @hospital.doctors.create!(name: "Dr. John", specialty: "Forensic Pathology", university: "UC")
    @dr3 = @hospital.doctors.create!(Name: "Meredith Grey", Specialty: "General Surgery", Education: "Harvard University")
    @deadperson1 = @dr2.patients.create!(name: "John Doe", age: 78)
    @deadperson2 = @dr2.patients.create!(name: "Jane Doe", age: 90)
    @otherpatient1 = Patient.create!(name: "JS Bach", age: 65)
    @otherpatient2 = Patient.create!(name: "Debussy", age: 55)
    DoctorPatient.create!(doctor: @dr1, patient: @otherpatient1)
    DoctorPatient.create!(doctor: @dr2, patient: @otherpatient1)
    DoctorPatient.create!(doctor: @dr1, patient: @otherpatient2)
    DoctorPatient.create!(doctor: @dr2, patient: @otherpatient2)
  end

  describe "hospital_staff" do 
    it 'shows the hospitals name' do
      visit "hospital/#{@hospital.id}"
      expect(page).to have_content(@hospital1.name)
    end
  
    it 'shows all the doctors and their patient load' do 
      visit "hospital/#{@hospital.id}"
      expect(page).to have_content(@dr1.name)
      expect(page).to have_content(@dr1.patients.count)
      expect(page).to have_content(@dr2.patients.count)
      expect(page).to have_content(@dr2.name)
      expect(page).to have_content(@dr3.name)
      expect(page).to have_content(@dr3.patients.count)
  
    end

    it 'lists the doctors by amount of patients, most to least' do



    end
  end
end