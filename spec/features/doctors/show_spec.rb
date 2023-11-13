require "rails_helper"

RSpec.describe "doctors show page", type: :feature do
  before(:each) do
    @general = create(:hospital)
    @doc = create(:doctor, hospital_id: @general.id)
    @doc2 = create(:doctor, hospital_id: @general.id)
    @patient1 = create(:patient)
    @patient2 = create(:patient)
    DoctorPatient.create!(doctor_id: @doc.id, patient_id: @patient1.id)
    DoctorPatient.create!(doctor_id: @doc.id, patient_id: @patient2.id)
    DoctorPatient.create!(doctor_id: @doc2.id, patient_id: @patient2.id)
  end

  it "has all the doctors information, the hospital, and all patients" do
    # User Story 1, Doctors Show Page
    # As a visitor
    # When I visit a doctor's show page
    # I see all of that doctor's information including:
    #  - name
    #  - specialty
    #  - university where they got their doctorate
    # And I see the name of the hospital where this doctor works
    # And I see the names of all of the patients this doctor has
    visit doctor_path(@doc)

    expect(page).to have_content "Name: #{@doc.name}"
    expect(page).to have_content "Specialty: #{@doc.specialty}"
    expect(page).to have_content "University: #{@doc.university}"
    expect(page).to have_content "Hospital: #{@doc.hospital.name}"
    @doc.patients.each do |patient|
      expect(page).to have_content patient.name
    end
  end

  it "allows user to remove patient from one doctor but not another" do
    # User Story 2, Remove a Patient from a Doctor
    # As a visitor
    # When I visit a Doctor's show page
    # Then next to each patient's name, I see a button to remove that patient from that doctor's caseload
    # When I click that button for one patient
    # I'm brought back to the Doctor's show page
    # And I no longer see that patient's name listed
    # And when I visit a different doctor's show page that is caring for the same patient,
    # Then I see that the patient is still on the other doctor's caseload
    visit doctor_path(@doc)

    within("#patient-#{@patient2.id}") do
      click_button "Remove"
    end

    expect(page).to_not have_content @patient2.name

    visit doctor_path(@doc2)

    expect(page).to have_content @patient2.name
  end
end
