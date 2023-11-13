require 'rails_helper'

RSpec.describe Patient do
  it {should have_many :doctor_patients}
  it {should have_many(:doctors).through(:doctor_patients)}

  describe "class methods" do 
    before(:each) do 
      load_test_data
    end
    describe "self.adult_patients" do 
      it "finds all patients that are 18 years old or older" do 
        adults = Patient.adult_patients
        expect(adults).to eq([@patient2, @patient1, @patient4, @patient3])
      end
    end
  end
end