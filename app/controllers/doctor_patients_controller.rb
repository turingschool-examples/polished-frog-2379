class DoctorPatientsController < ApplicationController
  def destroy
    doctor = Doctor.find(params[:doctor_id])
    patient = Patient.find(params[:patient_id])
    DoctorPatient.find_by(doctor: doctor, patient: patient).destroy
    redirect_to "/doctors/#{doctor.id}"
  end
end