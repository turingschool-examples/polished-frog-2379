require "rails_helper" 

RSpec.describe "Hospitals Show Page" do 
  before(:each) do 
    @grey_sloan = Hospital.create!({name: "Grey Sloan Memorial Hospital"})
    @seaside = Hospital.create!({name: "Seaside Health & Wellness Center"})

    @meredith = Doctor.create!({name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University", hospital_id: @grey_sloan.id})
    @alex = Doctor.create!({name: "Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University", hospital_id: @grey_sloan.id})
    @miranda = Doctor.create!({name: "Miranda Bailey", specialty: "General Surgery", education: "Stanford University", hospital_id: @seaside.id})
    @mcdreamy = Doctor.create!({name: "Derek 'McDreamy' Shepherd", specialty: "Attending Surgeon", education: "University of Pennsylvania", hospital_id: @seaside.id})

    @katie = Patient.create!({name: "Katie Bryce", age: 24})
    @denny = Patient.create!({name: "Denny Duquette", age: 39})
    @rebecca = Patient.create!({name: "Rebecca Pope", age: 32})
    @zola = Patient.create!({name: "Zola Shepherd", age: 2})

    @merekate= PatientDoctor.create!({patient_id: @katie.id, doctor_id: @meredith.id})
    @denalex = PatientDoctor.create!({patient_id: @denny.id, doctor_id: @alex.id})
    @mirbecca = PatientDoctor.create!({patient_id: @rebecca.id, doctor_id: @miranda.id})
    @zoladeth = PatientDoctor.create!({patient_id: @zola.id, doctor_id: @meredith.id})
    @mcbecca = PatientDoctor.create!({patient_id: @rebecca.id, doctor_id: @mcdreamy.id})
  end
    
  it "displays the hospital name and the names of all the doctors who work at that hospital" do 

    visit "/hospitals/#{@grey_sloan.id}"
    
    expect(page).to have_content("Grey Sloan Memorial Hospital")
    expect(page).to have_content("Doctor: Meredith Grey")
    expect(page).to have_content("Number of Patients: 2")
    expect(page).to have_content("Doctor: Alex Karev")
    expect(page).to have_content("Number of Patients: 1")

    expect(page).to_not have_content("Doctor: Miranda Bailey")
    expect(page).to_not have_content("Doctor: Derek 'McDreamy' Shepherd")

    visit "/hospitals/#{@seaside.id}"

    expect(page).to have_content("Seaside Health & Wellness Center")
    expect(page).to have_content("Doctor: Miranda Baile")
    expect(page).to have_content("Number of Patients: 1")
    expect(page).to have_content("Doctor: Derek 'McDreamy' Shepherd")
    expect(page).to have_content("Number of Patients: 1")

    expect(page).to_not have_content("Doctor: Meredith Grey")
    expect(page).to_not have_content("Doctor: Alex Karev")
  end
   
end 