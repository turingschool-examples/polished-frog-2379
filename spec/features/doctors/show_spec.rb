require "rails_helper"

RSpec.describe "Doctors Show Page", type: :feature do
  before :each do
    @hospital1 = Hospital.create!(name: "Grey Sloan Memorial Hospital")
    @hospital2 = Hospital.create!(name: "Seaside Health & Wellness Center")

    @doctor1 = Doctor.create!
  end
  describe "As a visitor" do
    describe "When I visit a doctors show page" do
      describe "I see all that doctors information (name, specialty, university)" do
        it "And I see the name of their hospital and the names of their patients this doctor has" do

        end
      end
    end
  end
end