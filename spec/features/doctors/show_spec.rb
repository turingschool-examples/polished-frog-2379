require "rails_helper"

RSpec.describe "Doctor Show" do 
  before :each do 
    @deacon = Hospital.create!(name: "Deaconess Gateway Hospital")
    
    @doc = Doctor.create!(name: "Lascalla", specialty: "Hormone growth", university: "University of Georgia", hospital_id: @deacon.id)
    
    @joel = Patient.create!(name: "Joel Taylor", age: 18)
    @casey = Patient.create!(name: "Casey Amar", age: 31)

    DoctorPatient.create!(doctor_id: @doc.id, patient_id: @joel.id)
    DoctorPatient.create!(doctor_id: @doc.id, patient_id: @casey.id)
  end

  it "shows a dcotors infomation, patients, and hospital" do 
    visit "/doctors/#{@doc.id}"

    expect(page).to have_content(@doc.name)
    expect(page).to have_content(@doc.specialty)
    expect(page).to have_content(@doc.university)

    expect(page).to have_content(@deacon.name)

    expect(page).to have_content(@joel.name)
    expect(page).to have_content(@joel.age)

    expect(page).to have_content(@casey.name)
    expect(page).to have_content(@casey.age)
  end
end