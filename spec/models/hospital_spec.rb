require "rails_helper"

RSpec.describe Hospital do
  it { should have_many :doctors }

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

    describe "#docs_ordered_by_patients" do
      it "returns the doctors ordered by patient counts" do
        expect(@general.docs_ordered_by_patients).to eq [@doc, @doc2]
      end
    end
  end
end
