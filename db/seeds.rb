# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@hospital_1 = Hospital.create!(name: "Grey Sloan Memorial Hospital")
@hospital_2 = Hospital.create!(name: "Seaside Health & Wellness Center")
@doctor_1 = @hospital_1.doctors.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University")
@doctor_2 = @hospital_1.doctors.create!(name: "Alex Karev", specialty: "Pediatric Surgery", university: "Johns Hopkins University")
@patient_1 = @doctor_1.patients.create!(name: "Katie Bryce", age: 24)
@patient_2 = @doctor_1.patients.create!(name: "Denny Duquette", age: 39)
@patient_3 = Patient.create!(name: "Rebecca Pope", age: 32)