require 'rails_helper'

RSpec.describe 'patient index' do
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


  it 'shows names of all patients over the age of 18' do
    visit "/patients"
    expect(page).to have_content(@p2.name)
    expect(page).to have_content(@p3.name)
    expect(page).to have_content(@p4.name)
    expect(page).to have_content(@p6.name)
    expect(page).to have_content(@p7.name)
    expect(page).to have_content(@p8.name)
    save_and_open_page
  end

  it 'lists the names from A-Z' do
  visit "/patients"
  expect(@p7.name).to appear_before(@p3.name)
  expect(@p3.name).to appear_before(@p4.name)
  expect(@p4.name).to appear_before(@p8.name)
  expect(@p8.name).to appear_before(@p6.name)
  expect(@p6.name).to appear_before(@p2.name)
  end

end