# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@hospital1= Hospital.create(Name: "Grey Sloan Memorial Hospital")
@hospital2 = Hospital.create(Name: "Seaside Health & Wellness Center")

@doctor1 = @hospital1.doctors.create(Name: "Meredith Grey", Specialty: "General Surgery", University: "Harvard University")
@doctor2 = @hospital1.doctors.create(Name: "Alex Karev", Specialty: "Pediatric Surgery", University: "Johns Hopkins University")
@doctor3 = @hospital2.doctors.create(Name: "Miranda Bailey", Specialty: "General Surgery", University: "Stanford University")
@doctor4 = @hospital2.doctors.create(Name: "Derek McDreamy Shepherd", Specialty: "Attending Surgeon", University: "University of Pennsylvania")

@patient1 = Patient.create(Name: "Katie Bryce", Age: 24)
@patient2 = Patient.create(Name: "Denny Duquette", Age: 39)
@patient3 = Patient.create(Name: "Rebecca Pope", Age: 32)
@patient4 = Patient.create(Name: "Zola Shepherd", Age: 2)

@doctor_patient1 = DoctorPatient.create(doctor_id: @doctor1.id, patient_id: @patient1.id)
@doctor_patient1 = DoctorPatient.create(doctor_id: @doctor3.id, patient_id: @patient1.id)
@doctor_patient1 = DoctorPatient.create(doctor_id: @doctor4.id, patient_id: @patient1.id)
@doctor_patient1 = DoctorPatient.create(doctor_id: @doctor1.id, patient_id: @patient2.id)
@doctor_patient1 = DoctorPatient.create(doctor_id: @doctor1.id, patient_id: @patient3.id)
@doctor_patient1 = DoctorPatient.create(doctor_id: @doctor2.id, patient_id: @patient4.id)