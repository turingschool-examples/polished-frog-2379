require 'rails_helper' 

RSpec.describe "Doctor Show Page (/doctors/:id)" do 
  before(:each) do 
    load_test_data
  end

  describe "visiting a Doctor's show page" do 
    it "displays all of a Doctor's information (name, specialty, university), the Hospital they work at and the names of their Patients" do 
      visit "/doctors/#{@doctor1.id}"

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
  describe "removing a Patient from a Doctor" do 
    it "displays a 'Remove (patient name)' button next to each Patients name, clicking that button removes it from the Doctors workload." do 
      visit "/doctors/#{@doctor1.id}"
      within "#patients" do
        expect(page).to have_content(@patient3.name)
        expect(page).to have_button("Remove #{@patient3.name}")
        expect(page).to have_content(@patient2.name)
        click_button "Remove #{@patient3.name}"
      end
      expect(current_path).to eq("/doctors/#{@doctor1.id}")
      within "#patients" do
        expect(page).to have_content("Patients")
        expect(page).to_not have_content(@patient3.name)
        expect(page).to have_content(@patient2.name)
      end
    end
    it "will will not remove a Patien from their other Doctor's workloads." do 
      visit "/doctors/#{@doctor1.id}"
      within "#patients" do
        expect(page).to have_content(@patient3.name)
        expect(page).to have_button("Remove #{@patient3.name}")
        expect(page).to have_content(@patient2.name)
        click_button "Remove #{@patient3.name}"
      end
      visit "/doctors/#{@doctor3.id}"
      within "#patients" do
        expect(page).to have_content("Patients")
        expect(page).to have_content(@patient3.name)
        expect(page).to have_content(@patient2.name)
      end
    end
  end
end 