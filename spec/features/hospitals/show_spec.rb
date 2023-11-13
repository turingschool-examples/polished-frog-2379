require 'rails_helper' 

RSpec.describe "Hospital Show Page (/hospitals/:id)" do 
  before(:each) do 
    load_test_data
  end

  describe "visiting a Hospital's show page" do 
    it "displays all of a Hospital's name, the names of all Doctors that work at the Hospital, and number of Patients under each Doctor. ordered by Patient count" do 
      visit "/hospitals/#{@hospital1.id}"

      expect(page).to have_content(@hospital1.name)
      expect(page).to have_content("Doctors:")
      expect(page).to have_content("#{@doctor1.name} - Patients: 2")
      expect(page).to have_content("#{@doctor2.name} - Patients: 3")
      this = @doctor2.name
      that = @doctor1.name
      expect(this).to appear_before(that)
    end
  end
end 