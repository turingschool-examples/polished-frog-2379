# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@hospital1= Hospital.create(name: "Grey Sloan Memorial Hospital")
@hospital2 = Hospital.create(name: "Seaside Health & Wellness Center")

@doctor1 = @hospital1.doctors.create(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University")
@doctor2 = @hospital1.doctors.create(name: "Alex Karev", specialty: "Pediatric Surgery", university: "Johns Hopkins University")
@doctor3 = @hospital2.doctors.create(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
@doctor4 = @hospital2.doctors.create(name: "Derek McDreamy Shepherd", specialty: "Attending Surgeon", university: "University of Pennsylvania")

@patient1 = Patient.create(name: "Katie Bryce", age: 24)
@patient2 = Patient.create(name: "Denny Duquette", age: 39)
@patient3 = Patient.create(name: "Rebecca Pope", age: 32)
@patient4 = Patient.create(name: "Zola Shepherd", age: 2)
@patient5 = Patient.create(name: "Zroof Zurlack", age: 22)
@patient6 = Patient.create(name: "Eisenhower Burtriss", age: 80)

@doctor_patient1 = DoctorPatient.create(doctor_id: @doctor1.id, patient_id: @patient1.id)
@doctor_patient1 = DoctorPatient.create(doctor_id: @doctor3.id, patient_id: @patient1.id)
@doctor_patient1 = DoctorPatient.create(doctor_id: @doctor4.id, patient_id: @patient1.id)
@doctor_patient1 = DoctorPatient.create(doctor_id: @doctor1.id, patient_id: @patient2.id)
@doctor_patient1 = DoctorPatient.create(doctor_id: @doctor1.id, patient_id: @patient3.id)
@doctor_patient1 = DoctorPatient.create(doctor_id: @doctor2.id, patient_id: @patient4.id)