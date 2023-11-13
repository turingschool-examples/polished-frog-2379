require 'rails_helper'

RSpec.describe Patient do
  it {should have_many(:patient_doctors)}
  it {should have_many(:doctors).through(:patient_doctors)}
end