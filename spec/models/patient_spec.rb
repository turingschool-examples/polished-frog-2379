require 'rails_helper'

RSpec.describe Patient do
  it {should have_many :doctor_patients}
  it {should have_many(:doctors).through(:doctor_patients)}

  it "sorts names alphabetically" do 
    joel = Patient.create!(name: "Joel Taylor", age: 18)
    casey = Patient.create!(name: "Casey Amar", age: 31)
    lucas = Patient.create!(name: "Lucas Kleeman", age: 17)
    blake = Patient.create!(name: "Blake S", age: 32)

    expect(Patient.alphabetical).to eq([blake, casey, joel, lucas])
  end
end