# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@hospital1 = Hospital.create!(name: "Muppet MD")
   
@doctor1 = @hospital1.doctors.create!(name: "Kermit", specialty: "legs and tounge", university: "Frog U Mississippi" )
@doctor2 = @hospital1.doctors.create!(name: "Fozzie", specialty: "fur and humor(s)", university: "Bear Comedy College" )

@patient1 = Patient.create!(name: "Rolff", age: 40 )
@patient2 = Patient.create!(name: "Rizzo", age: 45 )
@patient3 = Patient.create!(name: "Gonzo", age: 50 )
@patient4 = Patient.create!(name: "Scooter", age: 35 )

@doc_pat1 = DoctorPatient.create!(doctor: @doctor1, patient: @patient1)
@doc_pat2 = DoctorPatient.create!(doctor: @doctor1, patient: @patient2)
@doc_pat3 = DoctorPatient.create!(doctor: @doctor1, patient: @patient3)

@doc_pat4 = DoctorPatient.create!(doctor: @doctor2, patient: @patient2)
@doc_pat5 = DoctorPatient.create!(doctor: @doctor2, patient: @patient3)
@doc_pat6 = DoctorPatient.create!(doctor: @doctor2, patient: @patient4)