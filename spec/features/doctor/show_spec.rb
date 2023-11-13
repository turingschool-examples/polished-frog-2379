require 'rails_helper'

RSpec.describe "doctor show" do
  before (:each) do
    @hospital = Hospital.create!(name: "Anschutz")
    @dr1 = @hospital.doctors.create!(name: "Dr. Ruth", specialty: "TBD", university: "Georgetown?")
    @dr2 = @hospital.doctors.create!(name: "Dr. John", specialty: "Forensic Pathology", university: "UC")
    @deadperson1 = @dr2.patients.create!(name: "John Doe", age: 78)
    @deadperson2 = @dr2.patients.create!(name: "Jane Doe", age: 90)
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



end