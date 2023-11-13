require "rails_helper"

RSpec.describe Patient do 

  describe "relationships" do
    it { should have_many :patient_doctors}
    it { should have_many(:doctors).through(:patient_doctors) }
  end

  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
  end
  
  before(:each) do 
    @patient0 = Patient.create!({name: "Patient Zero", age: 26})
    @patient1 = Patient.create!({name: "Patient One", age: 39})
    @patient2 = Patient.create!({name: "Patient Two", age: 8})
   end

  describe "creation" do 
    it "is created as class Patient with a name and age attribute" do 
      expect(@patient0.class).to eq(Patient)
      expect(@patient0.name).to eq("Patient Zero")
      expect(@patient0.age).to eq(26)

    end
  end

  describe "instance methods" do 
    describe "#adult?" do 
      it "returns patients over the age of 18" do 
        expect(@patient0.adult?).to eq(true)
        expect(@patient2.adult?).to eq(false)
      end
    end
  end
  describe "class methods" do 
    describe "#sort" do 
      it "sorts patients who are over 18 by name ascending" do
        expect(Patient.sort).to eq([@patient1.name, @patient0.name])
      end
    end
  end
end 