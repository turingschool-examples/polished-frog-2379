require 'rails_helper'

RSpec.describe Patient, type: :model do
  describe '.adults' do
    it 'returns all patients over 18 years old, ordered by name' do
      @adult_1 = Patient.create!(name: 'John', age: 20)
      @minor = Patient.create!(name: 'Bob', age: 17)
      @adult_2 = Patient.create!(name: 'Alice', age: 25)

      expect(Patient.adults).to eq([@adult_2, @adult_1])
    end
  end
end
  

