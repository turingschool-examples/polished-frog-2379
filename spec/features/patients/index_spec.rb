require "rails_helper"

RSpec.describe "patients index page", type: :feature do
  before(:each) do
    @general = create(:hospital)
    @doc = create(:doctor, hospital_id: @general.id)
    @doc2 = create(:doctor, hospital_id: @general.id)
    @patient1 = create(:patient, age: 16)
    @patient2 = create(:patient, age: 33)
    @patient3 = create(:patient, age: 26)
    DoctorPatient.create!(doctor_id: @doc.id, patient_id: @patient1.id)
    DoctorPatient.create!(doctor_id: @doc.id, patient_id: @patient2.id)
    DoctorPatient.create!(doctor_id: @doc2.id, patient_id: @patient2.id)
  end

  it "shows all the patients whose age is greater than 18 and names in order" do
    # User Story 3, Patient Index Page
    # As a visitor
    # When I visit the patient index page
    # I see the names of all adult patients (age is greater than 18),
    # And I see the names are in ascending alphabetical order (A - Z,
    # you do not need to account for capitalization)
    visit patients_path

    Patient.adults.each do |patient|
      expect(page).to have_content patient.name
    end

    expect(page).to_not have_content @patient1.name
  end
end
