# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@hospital1 = Hospital.create!(name: "UC")
@hospital2 = Hospital.create!(name: "UTMB")
@doctor1 = @hospital1.doctors.create!(name: "Doctor 1", specialty: "Rheum", university: "LSU")
@doctor2 = @hospital2.doctors.create!(name: "Doctor 2", specialty: "Gastro", university: "MSU")
@doctor3 = @hospital2.doctors.create!(name: "Doctor 3", specialty: "Card", university: "KSU")
@doctor4 = @hospital1.doctors.create!(name: "Doctor 4", specialty: "ENT", university: "NSU")
@doctor5 = @hospital2.doctors.create!(name: "Doctor 5", specialty: "Ortho", university: "OSU")
@patient1 = @doctor1.patients.create!(name: "bPatient 1", age: 10)
@patient2 = @doctor1.patients.create!(name: "cPatient 2", age: 20)
@patient3 = @doctor2.patients.create!(name: "kPatient 3", age: 50)
@patient4 = @doctor1.patients.create!(name: "rPatient 4", age: 40)
@patient5 = @doctor3.patients.create!(name: "mPatient 5", age: 18)
@patient6 = @doctor3.patients.create!(name: "aPatient 6", age: 70)
@doctor4.patients << @patient1
@doctor4.patients << @patient2
@doctor3.patients << @patient2