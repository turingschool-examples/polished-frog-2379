require "rails_helper"

RSpec.describe "Doctor Show" do 
  before :each do 
    @deacon = Hospital.create!(name: "Deaconess Gateway Hospital")
    
    @doc1 = Doctor.create!(name: "Lascalla", specialty: "Hormone growth", university: "University of Georgia", hospital_id: @deacon.id)
    @doc2 = Doctor.create!(name: "Green", specialty: "Dermotology", university: "University of Alabama", hospital_id: @deacon.id)
    
    @joel = Patient.create!(name: "Joel Taylor", age: 18)
    @casey = Patient.create!(name: "Casey Amar", age: 31)

    DoctorPatient.create!(doctor_id: @doc1.id, patient_id: @joel.id)
    DoctorPatient.create!(doctor_id: @doc1.id, patient_id: @casey.id)

    DoctorPatient.create!(doctor_id: @doc2.id, patient_id: @joel.id)
  end

  it "shows a dcotors infomation, patients, and hospital" do 
    visit "/doctors/#{@doc1.id}"

    expect(page).to have_content(@doc1.name)
    expect(page).to have_content(@doc1.specialty)
    expect(page).to have_content(@doc1.university)

    expect(page).to have_content(@deacon.name)

    within "#patient-#{@joel.id}" do 
      expect(page).to have_content(@joel.name)
      expect(page).to have_content(@joel.age)
    end

    within "#patient-#{@casey.id}" do 
      expect(page).to have_content(@casey.name)
      expect(page).to have_content(@casey.age)
    end
  end

  it "removes a patient from one doctors show page but not another" do 
    visit "/doctors/#{@doc1.id}"

    within "#patient-#{@joel.id}" do 
      click_button("Remove")
    end

    expect(current_path).to eq("/doctors/#{@doc1.id}")
    expect(page).to_not have_content(@joel.name)
    expect(page).to_not have_content(@joel.age)

    visit "/doctors/#{@doc2.id}"
    expect(page).to have_content(@joel.name)
    expect(page).to have_content(@joel.age)
  end
end