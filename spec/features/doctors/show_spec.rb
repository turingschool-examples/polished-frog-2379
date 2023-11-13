require "rails_helper"

RSpec.describe "doctors show page", type: :feature do
  before(:each) do
    @general = create(:hospital)
    @doc = create(:doctor, hospital_id: @general.id)
    @patient1 = create(:patient)
    @patient2 = create(:patient)
    DoctorPatient.create!(doctor_id: @doc.id, patient_id: @patient1.id)
    DoctorPatient.create!(doctor_id: @doc.id, patient_id: @patient2.id)
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
end
