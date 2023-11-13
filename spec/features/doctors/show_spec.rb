require "rails_helper"

RSpec.describe "Doctor Show" do
  before(:each) do
    @hospital1 = Hospital.create(name: "U of U Hospital")
    @hospital2 = Hospital.create(name: "Central Piedmont Hospital")
    
    @doctor1 = @hospital1.doctors.create(name: "Dr. Belongea", specialty: "Osteopathic Medicine", university: "Stanford")
    @doctor2 = @hospital1.doctors.create(name: "Dr. Lucero", specialty: "Osteopathic Medicine", university: "VMA")

    @patient1 = Patient.create(name: "Alvin", age: 31)
    @patient2 = Patient.create(name: "Parker", age: 33)
    @patient3 = Patient.create(name: "Erin", age: 28)
    @patient4 = Patient.create(name: "Maddie", age: 29)
    @patient5 = Patient.create(name: "Shayne", age: 25)
    @patient6 = Patient.create(name: "Johnny", age: 27)
  end

  it "I see - Doctor info - Hospital - related patients" do
    # require 'pry'; binding.pry
    @doctor1.patients << @patient1
    @doctor1.patients << @patient2
    @doctor1.patients << @patient3

    visit "/doctors/#{@doctor1.id}"

    expect(page).to have_content("#{@doctor1.name}")
    expect(page).to have_content("#{@doctor1.specialty}")
    expect(page).to have_content("#{@doctor1.university}")
    expect(page).to have_content("#{@doctor1.hospital.name}")
    expect(page).to have_content("#{@patient1.name}")
    expect(page).to have_content("#{@patient2.name}")
    expect(page).to have_content("#{@patient3.name}")
  end
end