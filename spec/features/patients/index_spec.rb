require 'rails_helper'

RSpec.describe 'Patient Index Page', type: :feature do
  before(:each) do
    @patient_1 = Patient.create(name: 'John Doe', age: 20)
    @patient_2 = Patient.create(name: 'Jane Doe', age: 25)
    @patient_3 = Patient.create(name: 'Bob Smith', age: 30)
    @patient_4 = Patient.create(name: 'Alice Smith', age: 40)
    @patient_5 = Patient.create(name: 'Jimmy Smitts', age: 4)
  end

  describe 'As a visitor' do
    it 'shows the names of all adult patients in ascending alphabetical order' do
      visit patients_path
      
      expect(page).to have_content(@patient_4.name)
      expect(page).to have_content(@patient_3.name)
      expect(page).to have_content(@patient_2.name)
      expect(page).to have_content(@patient_1.name)
      expect(page).not_to have_content(@patient_5.name)

      expect(@patient_4.name).to appear_before(@patient_3.name)
      expect(@patient_4.name).to appear_before(@patient_2.name)
      expect(@patient_4.name).to appear_before(@patient_1.name)
      expect(@patient_3.name).to appear_before(@patient_2.name)
      expect(@patient_3.name).to appear_before(@patient_1.name)
      expect(@patient_2.name).to appear_before(@patient_1.name)
    end
  end
end
