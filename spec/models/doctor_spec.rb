require 'rails_helper'

RSpec.describe Doctor do
  it {should belong_to :hospital}
  it {should have_many :doctor_patients}
  it {should have_many(:patients).through(:doctor_patients)}


  describe "instance methods" do 
    before(:each) do 
      load_test_data
    end

    describe "#doctors_with_patient_count" do 
      it "finds all doctors working at a hospital and the number of patients each doctor sees, ordered by patient count" do 
        doctors_and_patients = @hospital1.doctors_with_patient_count
        expect(doctors_and_patients.first.name).to eq(@doctor2.name)
        expect(doctors_and_patients.first.patient_count).to eq(3)
      end
    end
  end
end