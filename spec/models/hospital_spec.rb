require 'rails_helper'

RSpec.describe Hospital do
  describe "relationships" do
    it {should have_many :doctors}
  end

  describe "instance methods" do
    before :each do 
      test_data
    end

    it "doctor patient counts" do
      expected_names = ["Meredith Grey", "Alex Karev"]
      actual = []
      @hospital1.doctor_patient_counts.each do |d|
        actual << d.name
      end
      expect(actual).to eq(expected_names)
    end
  end
end