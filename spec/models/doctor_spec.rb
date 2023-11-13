require "rails_helper"

RSpec.describe Doctor do
  it { should belong_to :hospital }

  describe "instance methods" do
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

    describe "#patient_count" do
      it "returns number of patients doc has" do
        expect(@doc.patient_count).to eq 2
        expect(@doc2.patient_count).to eq 1
      end
    end
  end
end
