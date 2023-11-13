require 'rails_helper' 

RSpec.describe "Doctor Show Page (/doctors/:id)" do 
  before(:each) do 
    load_test_data
  end

  describe "visiting the doctor show page" do 
    it "displays all of a doctors information (name, specialty, university), the Hospital they work at and the names of their Patients" do 
      visit doctor_show_path(@doctor1)

      expect(page).to have_content("Doctor #{@doctor1.name}")
      expect(page).to have_content("Specialty: #{@doctor1.specialty}")
      expect(page).to have_content("University: #{@doctor1.university}")
      expect(page).to have_content("Hospital: #{@hospital1.name}")
      within "#patients" do
        expect(page).to have_content("Patients")
        expect(page).to have_content(@patient3.name)
        expect(page).to have_content(@patient2.name)
      end
    end
  end
end 