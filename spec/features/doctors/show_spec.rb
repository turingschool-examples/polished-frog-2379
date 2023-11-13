require "rails_helper"

RSpec.describe "Doctor Show Page" do
  before(:each) do
    test_data
    visit doctor_path(@meredith)
  end

  describe '#USER STORY 1: DOCTOR SHOW PAGE' do
    it 'when visiting the show page, it shows the name, specialty, and university of the doctor' do
      expect(page).to have_content(@meredith.name)
      expect(page).to have_content(@meredith.specialty)
      expect(page).to have_content(@meredith.university)
    end

    it 'includes the name of the hospital where the doctor works' do
      expect(page).to have_content(@greysloan.name)
    end

    it 'has all of the patients that belong to this doctor' do
      expect(page).to have_content(@patient1.name)
      expect(page).to have_content(@patient2.name)
      expect(page).to have_content(@patient3.name)
      expect(page).to have_content(@patient4.name)
      expect(page).to have_content(@patient6.name)
    end

    describe '#USER STORY 2: REMOVE A PATIENT FROM A DOCTOR' do
    it 'each patient has a remove button' do
        patient_count = @meredith.patients.count
        expect(page).to have_button("Remove", count: patient_count)
      end
      
      it 'when clicking the remove button beside a patient, the patient is removed from the show page' do
        within("#patient-#{@patient1.id}") do
          click_button "Remove"
        end
        expect(current_path).to eq(doctor_path(@meredith))
        expect(page).to_not have_content(@patient1.name)
      end

      it 'checking another doctor show page, the patient is still listed' do
        within("#patient-#{@patient1.id}") do
          click_button "Remove"
        end
        visit doctor_path(@mark)
        expect(page).to have_content(@patient1.name)
      end
    end
  end

end