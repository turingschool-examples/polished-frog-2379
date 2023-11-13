# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
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