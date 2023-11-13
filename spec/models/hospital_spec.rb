require 'rails_helper'

RSpec.describe Hospital do
  before :each do
    test_data
  end

  it {should have_many :doctors}
  it {should have_many(:patients).through(:doctors)}
end