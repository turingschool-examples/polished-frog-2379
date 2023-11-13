require "rails_helper"

RSpec.describe "hospital show page", type: :feature do
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

  it "shows the hospitals details, including name, doctors, patients with doctors ordered by qty patients" do
    # Extension, Hospital Show Page
    # As a visitor
    # When I visit a hospital's show page
    # I see the hospital's name
    # And I see the names of all doctors that work at this hospital,
    # And next to each doctor I see the number of patients associated with the doctor,
    # And I see the list of doctors is ordered from most number of patients to least number of patients
    # (Doctor patient counts should be a single query)
    visit hospital_path(@general)

    expect(page).to have_content @general.name

    @general.docs_ordered_by_patients.each do |doc|
      within("#doc-#{doc.id}") do
        expect(page).to have_content doc.name
        expect(page).to have_content "Patients: #{doc.patients.count}"
      end
    end

    expect(@doc.name).to appear_before @doc2.name
  end
end
