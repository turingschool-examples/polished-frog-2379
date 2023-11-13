require 'rails_helper'

RSpec.describe Hospital do

  describe "relationshiops" do 
    it { should have_many :doctors}
  end

  describe "validations" do
    it { should validate_presence_of :name }
  end

  describe "it exists" do 
    it "is created as a Hospital class" do 
      @hospital = Hospital.create!({name: "Seattle Grace"})
      
      expect(@hospital.class).to eq(Hospital)
    end
    
    it "is created with a name attribute" do 
      @hospital = Hospital.create!({name: "Seattle Grace"})
      expect(@hospital.name).to eq("Seattle Grace")
    end
  end
end