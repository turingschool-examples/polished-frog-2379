def load_test_data
  @hospital1 = Hospital.create({name: "Grey Sloan Memorial Hospital"})
  @hospital2 = Hospital.create({name: "Seaside Health & Wellness Center"})
  @doctor1 = Doctor.create({name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University", hospital_id: @hospital1.id})
  @doctor2 = Doctor.create({name: "Alex Karev", specialty: "Pediatric Surgery", university: "Johns Hopkins University", hospital_id: @hospital1.id})
  @doctor3 = Doctor.create({name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University", hospital_id: @hospital2.id})
  @doctor4 = Doctor.create({name: "Derek McDreamy Shepherd", specialty: "Attending Surgeon", university: "University of Pennsylvania", hospital_id: @hospital2.id})
 
  @patient1 = Patient.create({name: "Katie Bryce", age: "24"})
  @patient2 = Patient.create({name: "Denny Duquette", age: "39"})
  @patient3 = Patient.create({name: "Rebecca Pope", age: "32"})
  @patient4 = Patient.create({name: "Zola Shepherd", age: "2"})

  DoctorPatient.create({doctor_id: @doctor1.id, patient_id: @patient3.id})
  DoctorPatient.create({doctor_id: @doctor1.id, patient_id: @patient2.id})
  DoctorPatient.create({doctor_id: @doctor2.id, patient_id: @patient1.id})
  DoctorPatient.create({doctor_id: @doctor2.id, patient_id: @patient4.id})
  DoctorPatient.create({doctor_id: @doctor3.id, patient_id: @patient3.id})
  DoctorPatient.create({doctor_id: @doctor3.id, patient_id: @patient2.id})
  DoctorPatient.create({doctor_id: @doctor4.id, patient_id: @patient1.id})
  DoctorPatient.create({doctor_id: @doctor4.id, patient_id: @patient4.id})
end