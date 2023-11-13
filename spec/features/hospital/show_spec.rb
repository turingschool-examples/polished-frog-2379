require 'rails_helper'

RSpec.describe "hospital show" do
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

  describe "hospital_staff" do 
    it 'shows the hospitals name' do
      visit "hospitals/#{@hospital.id}"
      expect(page).to have_content(@hospital.name)
    end
  
    it 'shows all the doctors and their patient load' do 
      visit "hospitals/#{@hospital.id}"
      expect(page).to have_content(@dr1.name)
      expect(page).to have_content(@dr1.patients.count)
      expect(page).to have_content(@dr2.patients.count)
      expect(page).to have_content(@dr2.name)
      expect(page).to have_content(@dr3.name)
      expect(page).to have_content(@dr3.patients.count)
  
    end

    it 'lists the doctors by amount of patients, most to least' do
      visit "hospitals/#{@hospital.id}"
      save_and_open_page
      expect(@dr2.name).to appear_before(@dr1.name)
      expect(@dr1.name).to appear_before(@dr3.name)

    end
  end
end