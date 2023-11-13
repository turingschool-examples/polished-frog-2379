class Doctors::PatientsController < ApplicationController
  def destroy
    doctor = Doctor.find(params[:doctor_id])
    patient = Patient.find(params[:id])
    doctor_patient = DoctorPatient.find_by({
      doctor: doctor, 
      patient: patient
    })
    
    doctor_patient.destroy

    redirect_to doctor_path(doctor)
  end
end