require 'rails_helper'

RSpec.describe "doctor show" do
  before (:each) do
    @hospital = Hospital.create!(name: "Anschutz")
    @dr1 = @hospital.doctors.create!(name: "Dr. Ruth", specialty: "TBD", university: "Georgetown?")
    @dr2 = @hospital.doctors.create!(name: "Dr. John", specialty: "Forensic Pathology", university: "UC")
  end

  it 'should show name, specialty, and university' do
    visit "/doctors/#{@dr1.id}"
    expect(page).to have_content(@dr1.name)
    expect(page).to have_content(@dr1.specialty)
    expect(page).to have_content(@dr1.university)
  end
  
  it 'should show the name of the hospital and patients' do
    visit "/doctors/#{@dr1.id}"
  end



end