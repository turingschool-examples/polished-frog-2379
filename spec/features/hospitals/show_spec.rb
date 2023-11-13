require "rails_helper"

RSpec.describe "Hospital Show Page" do
  before(:each) do
    test_data
    visit hospital_path(@greysloan)
  end

  describe 'EXTENSION: HOSPITAL SHOW PAGE' do
    it 'when visiting the show page, lists the name of the hospital' do
      expect(page).to have_content(@greysloan.name)
    end

    it 'also returns the names of all doctors that work at this hospital' do
      doctors = @greysloan.doctors
      doctors.each do |d|
        expect(page).to have_content(d.name)
      end
    end

    it 'has the number of patients associated with the doctor next to each doctor name' do
      doctors.each do |d|
        patient_count = d.patients.count
        within("#doctor-#{d.id}") do
          expect(page).to have_content("# of Patients: #{patient_count}")
        end
      end
    end

    it 'list of doctors are ordered from number of patients to least number of patients' do
      alph_doc = Doctor.all.sort_by{|d| d.name}
      expect(@alex.name).to appear_before(@cristina.name)
      expect(@cristina.name).to appear_before(@derek.name)
      expect(@derek.name).to appear_before(@mark.name)
      expect(@mark.name).to appear_before(@meredith.name)
    end
  end
end