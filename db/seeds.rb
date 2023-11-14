# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

PatientDoctor.destroy_all
Patient.destroy_all
Doctor.destroy_all
Hospital.destroy_all

@grey_sloan = Hospital.create!({name: "Grey Sloan Memorial Hospital"})
@seaside = Hospital.create!({name: "Seaside Health & Wellness Center"})

@meredith = Doctor.create!({name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University", hospital_id: @grey_sloan.id})
@alex = Doctor.create!({name: "Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University", hospital_id: @grey_sloan.id})
@miranda = Doctor.create!({name: "Miranda Bailey", specialty: "General Surgery", education: "Stanford University", hospital_id: @seaside.id})
@mcdreamy = Doctor.create!({name: "Derek 'McDreamy' Shepherd", specialty: "Attending Surgeon", education: "University of Pennsylvania", hospital_id: @seaside.id})

@katie = Patient.create!({name: "Katie Bryce", age: 24})
@denny = Patient.create!({name: "Denny Duquette", age: 39})
@rebecca = Patient.create!({name: "Rebecca Pope", age: 32})
@zola = Patient.create!({name: "Zola Shepherd", age: 2})

@merekate= PatientDoctor.create!({patient_id: @katie.id, doctor_id: @meredith.id})
@denalex = PatientDoctor.create!({patient_id: @alex.id, doctor_id: @alex.id})
@mirbecca = PatientDoctor.create!({patient_id: @rebecca.id, doctor_id: @rebecca.id})
@mczola = PatientDoctor.create!({patient_id: @zola.id, doctor_id: @meredith.id})