require 'rails_helper' 

RSpec.describe "Hospital Show Page (/hospitals/:id)" do 
  before(:each) do 
    load_test_data
  end

  describe "visiting a Hospital's show page" do 
    it "displays all of a Hospital's information (name, specialty, university), the Hospital they work at and the names of their Patients" do 
      visit "/hospitals/#{@hospital1.id}"

      within "#patients" do
        expect(page).to have_content("Patients")
        expect(page).to have_content(@patient4.name)
      end
    end
  end
end 