require 'rails_helper'

RSpec.describe Patient do
  before (:each) do
    @p1 = Patient.create!(name: "Alan", age: 15)
    @p2 = Patient.create!(name: "Heidi", age: 100)
    @p3 = Patient.create!(name: "Cory", age: 33)
    @p4 = Patient.create!(name: "Dana", age: 40)
    @p5 = Patient.create!(name: "Eloise", age: 12)
    @p6 = Patient.create!(name: "George", age: 34)
    @p7 = Patient.create!(name: "Brendan", age: 36)
    @p8 = Patient.create!(name: "Frank", age: 18)
  end
  describe 'relationships' do
    it {should have_many :doctor_patients}
    it {should have_many(:doctors).through(:doctor_patients)}
  end

  describe 'class methods' do
    it 'alphabetize' do
    expect(Patient.alphabetize).to eq([@p1, @p7, @p3, @p4, @p5, @p8, @p6, @p2])
    end

    it 'no_minors' do
      expect(Patient.no_minors).to eq([@p2, @p3, @p4, @p6, @p7, @p8])
    end
  
  end
end