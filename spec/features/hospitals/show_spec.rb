require "rails_helper"

RSpec.describe "Hospital Show" do
  before(:each) do
    @hospital_1 = Hospital.create!(name: "Shibuya Medical")

    @doctor_1 = Doctor.create!(name: "Gojo Satoru", specialty: "Infinity", university: "Jujutsu Uni", hospital_id: @hospital_1.id)
    @doctor_2 = Doctor.create!(name: "Sakuna Ryomen", specialty: "Incarnation", university: "Heian Uni", hospital_id: @hospital_1.id)

    @patient_1 = Patient.create!(name: "Yuji Itadori", age: 7)
    @patient_2 = Patient.create!(name: "Megumi Fushiguro", age: 14)
    @patient_3 = Patient.create!(name: "Maki Zenin", age: 21)
    @patient_4 = Patient.create!(name: "Toji Fushiguro", age: 28)
    @patient_5 = Patient.create!(name: "Nanami T", age: 35)
    @patient_6 = Patient.create!(name: "Geto Suguru", age: 42)
    @patient_7 = Patient.create!(name: "Yuta O", age: 49)

    @dp_1 = DoctorPatient.create!(doctor_id: @doctor_1.id, patient_id: @patient_1.id)
    @dp_2 = DoctorPatient.create!(doctor_id: @doctor_1.id, patient_id: @patient_2.id)
    @dp_3 = DoctorPatient.create!(doctor_id: @doctor_1.id, patient_id: @patient_3.id)
    @dp_4 = DoctorPatient.create!(doctor_id: @doctor_1.id, patient_id: @patient_4.id)
    @dp_5 = DoctorPatient.create!(doctor_id: @doctor_2.id, patient_id: @patient_5.id)
    @dp_6 = DoctorPatient.create!(doctor_id: @doctor_2.id, patient_id: @patient_6.id)
    @dp_7 = DoctorPatient.create!(doctor_id: @doctor_2.id, patient_id: @patient_7.id)
  end

  describe "EXT - hospital show page" do
    it "I see the names of all adult patients in ascending alphabetical order" do
      visit "/hospitals/#{@hospital_1.id}"

      save_and_open_page

      within "#hospital-info" do
        expect(page).to have_content(@hospital_1.name)
        expect(page).to have_content(@doctor_1.name)
        expect(page).to have_content("Number of Patients: 4")

        expect(page).to have_content(@doctor_2.name)
        expect(page).to have_content("Number of Patients: 3")
      end

      expect(@doctor_1.name).to appear_before(@doctor_2.name)
    end
  end
end
