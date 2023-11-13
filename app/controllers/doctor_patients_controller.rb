class DoctorPatientsController < ApplicationController
  def destroy
    doc = Doctor.find(params[:doctor_id])
    patient = Patient.find(params[:patient_id])

    DoctorPatient.find_by(doctor: doc, patient: patient).destroy 
    redirect_to "/doctors/#{params[:doctor_id]}"
  end
end