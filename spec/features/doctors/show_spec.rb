require "rails_helper"

RSpec.describe "Doctors Show" do
  before(:each) do
    @hospital_1 = Hospital.create!(name: "Shibuya Medical")

    @doctor_1 = Doctor.create!(name: "Gojo Satoru", specialty: "Infinity", university: "Jujutsu Uni", hospital_id: @hospital_1.id)

    @patient_1 = Patient.create!(name: "Yuji Itadori", age: 7)
    @patient_2 = Patient.create!(name: "Megumi Fushiguro", age: 14)
    @patient_3 = Patient.create!(name: "Maki Zenin", age: 21)

    @dp_1 = DoctorPatient.create!(doctor_id: @doctor_1.id, patient_id: @patient_1.id)
    @dp_2 = DoctorPatient.create!(doctor_id: @doctor_1.id, patient_id: @patient_2.id)
    @dp_3 = DoctorPatient.create!(doctor_id: @doctor_1.id, patient_id: @patient_3.id)
  end

  describe "US1 - doctors show page" do
    describe "I see all the doctors info and the hospital they work at" do
      it "I see the names of all the doctors patients as well" do
        visit "hospitals/#{@hospital_1.id}/doctors/#{@doctor_1.id}"

        save_and_open_page

        within "#doctor-info" do
          expect(page).to have_content(@doctor_1.name)
          expect(page).to have_content(@doctor_1.specialty)
          expect(page).to have_content(@doctor_1.university)
          expect(page).to have_content("Hospital Attending: Shibuya Medical")
        end

        within "#doctors-patients" do
          expect(page).to have_content("Yuji Itadori")
          expect(page).to have_content("Megumi Fushiguro")
          expect(page).to have_content("Maki Zenin")
        end
      end
    end
  end
end
