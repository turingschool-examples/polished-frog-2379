class DoctorPatientsController < ApplicationController
  def destroy
    patient = Patient.find(params[:id])
    doctor = Doctor.find(params[:doctor_id])
    doctor.patients.destroy(patient)
    redirect_to doctor_path(doctor)
  end
end