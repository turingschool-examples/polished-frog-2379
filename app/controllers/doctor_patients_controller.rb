class DoctorPatientsController < ApplicationController
  def destroy
    doctor = Doctor.find(params[:id])
    DoctorPatient.find_by(doctor: doctor.id, patient: params[:patient_id]).destroy
    redirect_to doctor_path(doctor)
  end

end