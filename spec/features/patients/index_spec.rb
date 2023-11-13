require "rails_helper" 

RSpec.describe "Patients Index Page" do 
  before(:each) do 
    
    @patient0 = Patient.create!({name: "Patient Zero", age: 26})
    @patient1 = Patient.create!({name: "Patient One", age: 39})
    @patient2 = Patient.create!({name: "Patient Two", age: 8})
  end
    
  it "displays the names of all adult patients" do 

    visit "/patients"

    expect(page).to have_content("Patient Zero")
    expect(page).to have_content("Patient One")
    expect(page).to_not have_content("Patient Two")
  end

  it "displays the names of all adult patients alphabetically" do 
    visit "/patients"

    expect("Patient Zero").to appear_before("Patient One")
  end

end 