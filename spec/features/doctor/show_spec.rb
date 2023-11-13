require 'rails_helper'

RSpec.describe "doctor show" do
  before (:each) do
    @hospital = Hospital.create!(name: "Anschutz")
    @dr1 = @hospital.doctors.create!(name: "Dr. Ruth", specialty: "TBD", university: "Georgetown?")
    @dr2 = @hospital.doctors.create!(name: "Dr. John", specialty: "Forensic Pathology", university: "UC")
    @deadperson1 = @dr2.patients.create!(name: "John Doe", age: 78)
    @deadperson2 = @dr2.patients.create!(name: "Jane Doe", age: 90)
    @otherpatient1 = Patient.create!(name: "JS Bach", age: 65)
    @otherpatient2 = Patient.create!(name: "Debussy", age: 55)
    DoctorPatient.create!(doctor: @dr1, patient: @otherpatient1)
    DoctorPatient.create!(doctor: @dr2, patient: @otherpatient1)
    DoctorPatient.create!(doctor: @dr1, patient: @otherpatient2)
    DoctorPatient.create!(doctor: @dr2, patient: @otherpatient2)
    #I'm not trying to be morbid, my father-in-law is a forensic pathologist, that was one of the first doctors I thought of and his patients are all dead people...


  end

  it 'should show name, specialty, and university' do
    visit "/doctors/#{@dr1.id}"
    expect(page).to have_content(@dr1.name)
    expect(page).to have_content(@dr1.specialty)
    expect(page).to have_content(@dr1.university)
  end
  
  it 'should show the name of the hospital and patients' do
    visit "/doctors/#{@dr2.id}"
    expect(page).to have_content(@hospital.name)
    expect(page).to have_content(@deadperson1.name)
    expect(page).to have_content(@deadperson2.name)
  end

  it 'allows you to remove a patient' do
#     When I visit a Doctor's show page
    visit "/doctors/#{@dr2.id}"
    expect(page).to have_content(@otherpatient1.name)
    expect(page).to have_button("Remove #{@otherpatient1}")
    click_button "Remove #{@otherpatient1}"
    expect(current_path).to eq("/doctors/#{@dr2.id}")
    expect(page).to_not have_content(@otherpatient1.name)
    
    visit "/doctors/#{@dr1.id}"
    expect(page).to have_content(@otherpatient1.name)

  end

end