require "rails_helper"

RSpec.describe "Patient Index" do 
  before :each do 
    @joel = Patient.create!(name: "Joel Taylor", age: 18)
    @casey = Patient.create!(name: "Casey Amar", age: 31)
    @lucas = Patient.create!(name: "Lucas Kleeman", age: 17)
    @blake = Patient.create!(name: "Blake S", age: 32)

    visit "/patients"
  end

  it "lists only adult patients over 18 year old" do 
    expect(page).to have_content(@blake.name)
    expect(page).to have_content(@casey.name)
    expect(page).to have_content(@joel.name)
    expect(page).to_not have_content(@lucas.name)
  end
  it "lists all adult patients in alphabetical order" do 
    expect(@blake.name).to appear_before(@casey.name)
    expect(@casey.name).to appear_before(@joel.name)
  end
end