class DoctorPatientsController < ApplicationController
  def destroy
    doctor = Doctor.find(params[:doctor_id])
    patient = Patient.find(params[:id])
    doctor.patients.delete(patient)

    redirect_to "/doctors/#{doctor.id}"
  end
end