class DoctorPatientsController < ApplicationController

  def destroy
    doctor = Doctor.find(params[:doctor_id])
    patient = Patient.find(params[:id])
    relationship = DoctorPatient.find_by(doctor: doctor, patient: patient).destroy
    redirect_to doctor_path(doctor)
  end
end