require 'rails_helper' 

RSpec.describe "Patients Index Page (/patients)" do 
  before(:each) do 
   load_test_data 
  end
  describe "visiting the Patients index page" do 
    it "displays the names of all adult patients in alphabetical order" do 
      visit "/patients"

      expect(page).to have_content("Patients Index")
      expect(page).to have_content(@patient1.name)
      expect(page).to have_content(@patient2.name)
      expect(page).to have_content(@patient3.name)
      this = @patient2.name
      that = @patient1.name
      expect(this).to appear_before(that)
    end
    it "will not display the names of Patients under 18" do 
      visit "/patients"

      expect(page).to_not have_content(@patient4.name)
    end
  end
end 