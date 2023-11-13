require "rails_helper"

RSpec.describe "Patients Index" do
  before(:each) do
    @hospital_1 = Hospital.create!(name: "Shibuya Medical")

    @doctor_1 = Doctor.create!(name: "Gojo Satoru", specialty: "Infinity", university: "Jujutsu Uni", hospital_id: @hospital_1.id)

    @patient_1 = Patient.create!(name: "Yuji Itadori", age: 7)
    @patient_2 = Patient.create!(name: "Megumi Fushiguro", age: 14)
    @patient_3 = Patient.create!(name: "Maki Zenin", age: 21)
    @patient_4 = Patient.create!(name: "Toji Fushiguro", age: 28)
    @patient_5 = Patient.create!(name: "Nanami T", age: 35)
    @patient_6 = Patient.create!(name: "Geto Z", age: 42)
    @patient_7 = Patient.create!(name: "Sakuna K", age: 49)

    @dp_1 = DoctorPatient.create!(doctor_id: @doctor_1.id, patient_id: @patient_1.id)
    @dp_2 = DoctorPatient.create!(doctor_id: @doctor_1.id, patient_id: @patient_2.id)
    @dp_3 = DoctorPatient.create!(doctor_id: @doctor_1.id, patient_id: @patient_3.id)
  end

  describe "US3 - patients index page" do
    it "I see the names of all adult patients in ascending alphabetical order" do
      visit "/patients"

      within "#patients" do
        expect(page).to have_no_content(@patient_1.name)
        expect(page).to have_no_content(@patient_2.name)

        expect(@patient_6.name).to appear_before(@patient_3.name)
        expect(@patient_3.name).to appear_before(@patient_5.name)
        expect(@patient_5.name).to appear_before(@patient_7.name)
        expect(@patient_7.name).to appear_before(@patient_4.name)
      end
    end
  end
end
