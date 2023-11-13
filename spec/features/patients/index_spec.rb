require "rails_helper"

RSpec.describe "Patient Index" do 
  before :each do 
    @joel = Patient.create!(name: "Joel Taylor", age: 18)
    @casey = Patient.create!(name: "Casey Amar", age: 31)
    @lucas = Patient.create!(name: "Lucas Kleeman", age: 17)
    @blake = Patient.create!(name: "Blake S", age: 32)

    visit "/patients"
  end

  it "lists all patients in alphabetical age" do 
    expect(@blake.name).to appear_before(@casey.name)
    expect(@casey.name).to appear_before(@joel.name)
    expect(@joel.name).to appear_before(@lucas.name)
  end
end