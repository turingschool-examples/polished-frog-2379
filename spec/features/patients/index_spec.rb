require "rails_helper"

RSpec.describe "Patient Index Page" do
  before(:each) do
    test_data
    visit patients_path
    @patients = Patient.all.find_all{|p| p.age >= 18}.uniq
  end

  describe 'USER STORY 3: PATIENT INDEX' do
    it 'when visiting the index, displays only the adult patients (age greater than 18)' do
      @patients.each do |p|
        expect(page).to have_content(p.name)
      end
      expect(page).to_not have_content(@patient2.name)
      expect(page).to_not have_content(@patient3.name)
    end

    it 'displays the names in ascending alphabetical order' do
      expect(@patient1.name).to appear_before(@patient6.name)
      expect(@patient6.name).to appear_before(@patient4.name)
      expect(@patient4.name).to appear_before(@patient5.name)
    end
  end
end