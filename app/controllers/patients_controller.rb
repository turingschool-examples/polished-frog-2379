class PatientsController < ApplicationController
  def destroy
    doctor = Doctor.find(params[:doctor_id])
    DoctorPatient.find_by(doctor: doctor.id, patient: params[:id]).destroy
    redirect_to doctor_path(doctor)
  end

end