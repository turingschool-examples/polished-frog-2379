@hospital1 = Hospital.create!(name: "General Hospital")

@doctor1 = @hospital1.doctors.create!(name: "Joseph Lee", specialty: "Pediatrics", university: "Harvard University")
@doctor2 = @hospital1.doctors.create!(name: "James Smith", specialty: "Heart Surgery", university: "Brown University")
@doctor3 = @hospital1.doctors.create!(name: "Jessica Simpson", specialty: "Family Medicine", university: "Duke University")

@patient1 = Patient.create!(name: "Josh Campbell", age: 37)
@patient2 = Patient.create!(name: "Rebecca Joy", age: 26)
@patient3 = Patient.create!(name: "Ruby Rails", age: 12)
@patient4 = Patient.create!(name: "Chris Brown", age: 40)

DoctorPatient.create!(doctor: @doctor1, patient: @patient1)
DoctorPatient.create!(doctor: @doctor1, patient: @patient2)
DoctorPatient.create!(doctor: @doctor2, patient: @patient3)
DoctorPatient.create!(doctor: @doctor3, patient: @patient4)
DoctorPatient.create!(doctor: @doctor1, patient: @patient4)
